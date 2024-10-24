output "ec2_sec_grp" {
  description = "bastion sec grp id to be used with the ec2 module"
  value       = aws_security_group.bastion_sec_grp.id
}

output "alb_sec_grp" {
  description = "alb security group to be attached to the prod alb"
  value       = aws_security_group.alb_sec_grp.id
}

output "ecs_sec_grp" {
  description = "Security group to be attached to the ECS service"
  value       = aws_security_group.ecs_sec_grp.id
}

