# modules/nat_gateway/variables.tf

variable "nat_gateway_name" {
  description = "The name of the NAT Gateway."
  type        = string
}

variable "location" {
  description = "The location for the NAT Gateway."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the NAT Gateway will be created."
  type        = string
}

variable "public_ip_id" {
  description = "The ID of the Public IP to associate with the NAT Gateway."
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the private subnet to associate with the NAT Gateway."
  type        = string
}
