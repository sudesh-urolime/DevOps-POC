resource "aws_lb" "prod_pub_alb" {
  name               = var.prod_pub_alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.prod_pub_alb_sec_grps
  #subnets            = [for subnet in aws_subnet.public : subnet.id]
  #subnets = [for subnet in var.prod_pub_alb_public_subnets_cidr_blocks : subnet]
  subnets = var.prod_pub_alb_public_subnets_ids

  enable_deletion_protection = true

  #access_logs {
  #  bucket  = aws_s3_bucket.lb_logs.id
  #  prefix  = "test-lb"
  #  enabled = true
  #}

  tags = {
    Environment = var.environment 
  }
}
