output "tg_arn" {
  description = "Target group arn"
  value       = aws_lb_target_group.prod_mealie_tg.arn
}

