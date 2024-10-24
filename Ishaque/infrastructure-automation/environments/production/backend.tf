# For remote state and state locking.
# S3 bucket and dynamodb table are created manually.
terraform {
  backend "s3" {
    bucket         = "mealie-terraform-state-bucket-1234"
    key            = "mealie/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
  }
}

# For testing only
# Set the default reigon.
#provider "aws" {
#  region = var.aws_region
#}
