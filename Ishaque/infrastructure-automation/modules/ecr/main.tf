# Create an ECR repository
resource "aws_ecr_repository" "prod_private_ecr" {
  name                 = var.ecr_repo
  image_tag_mutability = "MUTABLE" # or IMMUTABLE, depending on your preference
  image_scanning_configuration {
    scan_on_push = true # Enable image scanning
  }

  # Optional: Encryption configuration
  encryption_configuration {
    encryption_type = "AES256" # Default encryption type
  }

  # Optional: Lifecycle policy
  #lifecycle_policy {
  #  policy = <<POLICY
  #  {
  #    "rules": [
  #      {
  #        "rulePriority": 1,
  #        "description": "Keep only the last 5 images",
  #        "selection": {
  #          "tagStatus": "any",
  #          "countType": "imageCountMoreThan",
  #          "countNumber": 5
  #        },
  #        "action": {
  #          "type": "expire"
  #        }
  #      }
  #    ]
  #  }
  #  POLICY
  #}
}
