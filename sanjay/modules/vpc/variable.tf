variable "project_id" {
  type = string
}
variable "vpc_name" {
  type = string
}

variable "subnet_names" {
type = list(string)
}

variable "cidr_ranges" {
type = list(string)
}

variable "router_name" {
  type = string
}

variable "nat_name" {
  type = string
}

variable "region" {
  type = string
}