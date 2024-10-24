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
  type        = list(string)
}

variable "environment" {
  type = string
}

variable "tg_vpc_id" {
  description = "Id of the VPC in which the target group is deployed"
  type        = string
}

variable "tg_name" {
  description = "Target group name, must be unique in a region"
  type        = string
}

variable "prod_main_domain" {
  description = "Main production domain name"
  type        = string
}
