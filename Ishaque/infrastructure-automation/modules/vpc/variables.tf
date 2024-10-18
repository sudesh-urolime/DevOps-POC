variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

# To enable/disable the VPC DNS support
variable "enable_dns_support" {
  type = bool
}

# To enable/disable public IP allocation to the instances launched to the subnets
variable "map_public_ip_on_launch" {
  type = bool
}

variable "environment" {
  description = "Environment (dev or prod)"
  type        = string
}

variable "public_subnet_count" {
  description = "Number of public subnets to create"
  type        = number
  default     = 2
}

variable "public_subnets_cidr_blocks" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
}

variable "private_subnet_count" {
  description = "Number of private subnets to create"
  type        = number
  default     = 2
}

variable "private_subnets_cidr_blocks" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "igw_name" {
  description = "Internet gateway name"
  type        = string
}

variable "nat_name" {
  description = "NAT gateway name"
  type        = string
}

variable "pub_rt_name" {
  description = "public route table name"
  type        = string
}

variable "prvt_rt_name" {
  description = "private route table name"
  type        = string
}
