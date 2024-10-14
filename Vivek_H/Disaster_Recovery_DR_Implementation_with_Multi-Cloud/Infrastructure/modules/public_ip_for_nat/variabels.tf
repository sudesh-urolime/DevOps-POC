variable "public_ip_name" {
  description = "The name of the Public IP."
  type        = string
}

variable "location" {
  description = "The location for the Public IP."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Public IP will be created."
  type        = string
}
