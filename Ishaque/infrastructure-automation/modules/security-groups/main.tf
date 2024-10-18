# EC2 security group
resource "aws_security_group" "bastion_sec_grp" {
  name        = "bastion-sec-grp"
  description = "Allow TLS inbound traffic, SSH access and all outbound traffic"
  vpc_id      = module.vpc.aws_vpc.prod_vpc.id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "bastion-sec-grp"
  }
}

# Allow SSH access to the bastion server from everywhere
resource "aws_vpc_security_group_ingress_rule" "bastion_sec_grp_ipv4" {
  security_group_id = aws_security_group.bastion_sec_grp.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.bastion_sec_grp.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.bastion_sec_grp.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

#####
# ALB security group
resource "aws_security_group" "alb_sec_grp" {
  name        = "alb-sec-grp"
  description = "Allow TLS inbound traffic, SSH access and all outbound traffic"
  vpc_id      = module.vpc.aws_vpc.prod_vpc.id
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "alb-sec-grp"
  }
}

# Allow HTTP access to ALB from everywhere
resource "aws_vpc_security_group_ingress_rule" "alb_sec_grp_ipv4" {
  security_group_id = aws_security_group.alb_sec_grp.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

# Allow HTTPS access to ALB from everywhere
resource "aws_vpc_security_group_ingress_rule" "bastion_sec_grp_ipv4" {
  security_group_id = aws_security_group.bastion_sec_grp.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.alb_sec_grp.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.alb_sec_grp.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


#####
# ECS service security group
resource "aws_security_group" "ecs_sec_grp" {
  name        = "ecs-sec-grp"
  description = "Allow TLS inbound traffic, SSH access and all outbound traffic"
  vpc_id      = module.vpc.aws_vpc.prod_vpc.id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "ecs-sec-grp"
  }
}

# Allow HTTP connection from the ALB from everywhere
resource "aws_vpc_security_group_ingress_rule" "ecs_sec_grp_ipv4" {
  security_group_id = aws_security_group.ecs_sec_grp.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.ecs_sec_grp.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.ecs_sec_grp.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
