# modules/vnet/variables.tf
variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the VNet will be created."
  type        = string
}

variable "location" {
  description = "The location of the virtual network."
  type        = string
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  type        = list(string)
}

variable "public_subnet_prefix" {
  description = "The address prefix for the public subnet."
  type        = string
}

variable "private_subnet_prefix" {
  description = "The address prefix for the private subnet."
  type        = string
}

variable "public_ip" {
  description = "The public IP ID for the network interface."
  type        = string
}

variable "network_interface_name" {
  description = "Network interface name"
  type        = string

}