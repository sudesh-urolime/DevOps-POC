resource "aws_vpc" "this" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.vpc_name
    Environment = var.environment
  }
}

resource "aws_subnet" "public_subnet" {
  count = var.public_subnet_count

  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.public_subnets_cidr_blocks, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.vpc_name}-public-${count.index}"
    Environment = var.environment
  }
}
