variable "location" {
  description = "Location for the resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
  type        = string
}

variable "public_subnet_prefix" {
  description = "Address prefix for the public subnet"
  type        = string
}

variable "private_subnet_prefix" {
  description = "Address prefix for the private subnet"
  type        = string
}
