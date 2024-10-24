output "tg_arn" {
  description = "Target group arn"
  value       = aws_lb_target_group.prod_mealie_tg.arn
}

output "alb_dns_name" {
  description = "ALB dns name"
  value       = aws_lb.prod_pub_alb.dns_name
}

output "alb_zone_id" {
  description = "ALB zone id"
  value       = aws_lb.prod_pub_alb.zone_id
}


