# VPC configuration
resource "aws_vpc" "prod_vpc" {
  cidr_block         = var.cidr_block
  enable_dns_support = var.enable_dns_support

  tags = {
    Name        = var.vpc_name
    Environment = var.environment
  }
}

# Public subnet configuration
resource "aws_subnet" "public_subnet" {
  count = var.public_subnet_count

  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = element(var.public_subnets_cidr_blocks, count.index)
  availability_zone = element(var.azs, count.index)

  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name        = "${var.vpc_name}-public-${count.index + 1}"
    Environment = var.environment
  }
}

# Private subnet configuration
resource "aws_subnet" "private_subnet" {
  count             = var.private_subnet_count
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = element(var.private_subnets_cidr_blocks, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "${var.vpc_name}-private-${count.index + 1}"
    Environment = var.environment
  }
}

# Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.prod_vpc.id

  tags = {
    Name = var.igw_name
  }
}

# NAT gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags = {
    Name = var.nat_name
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

# Elastic IP to be attach to NAT gateway
resource "aws_eip" "nat_eip" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.igw]
}

# Public route table
# Note that the default route, mapping the VPC's CIDR block to "local", is created implicitly and cannot be specified
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.prod_vpc.id

  # Routing the packets to all other destinations except the VPC CIDR through IGW
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.pub_rt_name
  }
}

# Public route table association with the public subnets
resource "aws_route_table_association" "pub_rt_association" {
  count          = var.public_subnet_count
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

# Private route table
# Note that the default route, mapping the VPC's CIDR block to "local", is created implicitly and cannot be specified
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.prod_vpc.id

  # Routing the packets to all other destinations except the VPC CIDR through NAT
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = var.prvt_rt_name
  }
}

# Private route table association with the private subnets
resource "aws_route_table_association" "prvt_rt_association" {
  count          = var.private_subnet_count
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_rt.id
}
