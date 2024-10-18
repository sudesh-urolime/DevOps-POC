variable "nsg_name" {
  description = "The name of the Network Security Group"
  type        = string
  default     = "ssh_nsg"
}

variable "location" {
  description = "The location of the Network Security Group"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "network_interface_id" {
  description = "The ID of the network interface to associate with the NSG"
  type        = string
}
