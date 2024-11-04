# EC2 security group
resource "aws_security_group" "bastion_sec_grp" {
  name        = "bastion-sec-grp"
  description = "Allow SSH access, and all outbound traffic"
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "bastion-sec-grp"
  }
}

# Allow SSH access to the bastion server from everywhere
resource "aws_vpc_security_group_ingress_rule" "bastion_sec_grp_ssh" {
  security_group_id = aws_security_group.bastion_sec_grp.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "bastion_allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.bastion_sec_grp.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "bastion_allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.bastion_sec_grp.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

#####
# ALB security group
resource "aws_security_group" "alb_sec_grp" {
  name        = "alb-sec-grp"
  description = "Allow both HTTP and TLS inbound traffic,  and all outbound traffic"
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "alb-sec-grp"
  }
}

# Allow HTTP access to ALB from everywhere
resource "aws_vpc_security_group_ingress_rule" "alb_sec_grp_http" {
  security_group_id = aws_security_group.alb_sec_grp.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

# Allow HTTPS access to ALB from everywhere
resource "aws_vpc_security_group_ingress_rule" "alb_sec_grp_https" {
  security_group_id = aws_security_group.alb_sec_grp.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "alb_allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.alb_sec_grp.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "alb_allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.alb_sec_grp.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


#####
# ECS service security group
resource "aws_security_group" "ecs_sec_grp" {
  name        = "ecs-sec-grp"
  description = "Allow both HTTP and TLS inbound traffic from ALB, and all outbound traffic"
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "ecs-sec-grp"
  }
}

# Allow HTTP connection from the ALB
resource "aws_vpc_security_group_ingress_rule" "ecs_sec_grp_http" {
  security_group_id            = aws_security_group.ecs_sec_grp.id
  referenced_security_group_id = aws_security_group.alb_sec_grp.id
  from_port                    = 80
  ip_protocol                  = "tcp"
  to_port                      = 80
}

# Allow HTTPS connection from the ALB
resource "aws_vpc_security_group_ingress_rule" "ecs_sec_grp_https" {
  security_group_id            = aws_security_group.ecs_sec_grp.id
  referenced_security_group_id = aws_security_group.alb_sec_grp.id
  from_port                    = 443
  ip_protocol                  = "tcp"
  to_port                      = 443
}

# Allow port 9000 for the application to work
resource "aws_vpc_security_group_ingress_rule" "ecs_sec_grp_9000" {
  security_group_id            = aws_security_group.ecs_sec_grp.id
  referenced_security_group_id = aws_security_group.alb_sec_grp.id
  from_port                    = 9000
  ip_protocol                  = "tcp"
  to_port                      = 9000
}

resource "aws_vpc_security_group_egress_rule" "ecs_allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.ecs_sec_grp.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "ecsallow_all_traffic_ipv6" {
  security_group_id = aws_security_group.ecs_sec_grp.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
