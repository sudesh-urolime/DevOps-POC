# modules/resource_group/variables.tf
variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location where the resource group will be created."
  type        = string
}
