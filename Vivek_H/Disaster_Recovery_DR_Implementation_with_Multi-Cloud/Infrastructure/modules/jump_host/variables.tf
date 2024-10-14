# modules/jump_host/variables.tf

variable "location" {
  description = "The location for the Jump Host."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group for the Jump Host."
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet for the Jump Host."
  type        = string
}

variable "admin_password" {
  description = "The admin password for the Jump Host."
  type        = string
}

