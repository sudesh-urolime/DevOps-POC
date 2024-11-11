# Set the default reigon.
provider "aws" {
  region = var.aws_region
  description = "Default AWS region"
}

#variable "aws_region" {
#  default = "us-east-1"
#  type = string
#}

