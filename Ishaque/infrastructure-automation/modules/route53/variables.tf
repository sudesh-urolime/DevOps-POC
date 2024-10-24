variable "domain_name" {
  type = string
}

variable "r53_alb_dns_name" {
  description = "alb dns name to be pointed by the main domain"
  type        = string
}

variable "r53_alb_zone_id" {
  description = "ALB zone id"
  type        = string
}
