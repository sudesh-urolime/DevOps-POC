resource "aws_lb" "prod_pub_alb" {
  name               = var.prod_pub_alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.prod_pub_alb_sec_grps
  #subnets            = [for subnet in aws_subnet.public : subnet.id]
  #subnets = [for subnet in var.prod_pub_alb_public_subnets_cidr_blocks : subnet]
  subnets = var.prod_pub_alb_public_subnets_ids

  # If we enable the deletion protection then terraform will not be able to delete the resource.
  enable_deletion_protection = false

  #access_logs {
  #  bucket  = aws_s3_bucket.lb_logs.id
  #  prefix  = "test-lb"
  #  enabled = true
  #}

  tags = {
    Environment = var.environment
  }
}

# Listener 80, fixed response for testing
resource "aws_lb_listener" "front_end_http" {
  load_balancer_arn = aws_lb.prod_pub_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# Target group resource block
resource "aws_lb_target_group" "prod_mealie_tg" {
  name        = var.tg_name
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.tg_vpc_id
}

# ALB listener rule
resource "aws_lb_listener_rule" "static" {
  listener_arn = aws_lb_listener.front_end.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.prod_mealie_tg.arn
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }

  condition {
    host_header {
      values = [var.prod_main_domain]
    }
  }
}

# 443 Listener resource block
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.prod_pub_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn = aws_acm_certificate_validation.example.certificate_arn
  certificate_arn = var.alb_acm_cert_arn


  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}
