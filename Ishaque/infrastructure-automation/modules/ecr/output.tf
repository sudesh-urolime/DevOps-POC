# Output the ECR repository URL
output "ecr_repository_url" {
  value = aws_ecr_repository.prod_private_ecr.repository_url
}
