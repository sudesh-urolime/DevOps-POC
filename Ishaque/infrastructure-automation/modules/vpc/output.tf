output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.prod_vpc.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public_subnet[*].id
}

#output "alb_pub_sub_ids" {
#  description = "List of public subnet IDs for alb"
#  value       = [for subnet in aws_subnet.public_subnet[*] : subnet.id]
#}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = aws_subnet.private_subnet[*].id
}
