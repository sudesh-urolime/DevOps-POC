variable "prod_pub_alb_name" {
  description = "production public ALB name"
  type        = string
}

variable "prod_pub_alb_sec_grps" {
  description = "production public alb security group names"
  type        = list(any)
}

variable "prod_pub_alb_public_subnets_ids" {
  description = "Public subnets in which the alb should be deployed"
  type = list(string)
}

variable "environment" {
  type = string
}

