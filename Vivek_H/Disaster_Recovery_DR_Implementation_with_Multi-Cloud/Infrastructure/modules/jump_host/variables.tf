# modules/jump_host/variables.tf

variable "location" {
  description = "The location for the Jump Host."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group for the Jump Host."
  type        = string
}


variable "admin_password" {
  description = "The admin password for the Jump Host."
  type        = string
}

variable "net_interface_id" {
  description = "The admin password for the Jump Host."
  type        = string
}