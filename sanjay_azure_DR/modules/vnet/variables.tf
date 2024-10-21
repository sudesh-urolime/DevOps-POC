variable "resource_group_name" {
  description = "The name of the resource group in which the VNet is created."
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network."
  type        = string
}

variable "location" {
  description = "The location/region where the Virtual Network is created."
  type        = string
}

variable "network_address_space" {
  description = "The address space that is used by the Virtual Network."
  type        = list(string)
}

variable "aks_subnet_address_prefix" {
  description = "The address prefix for the AKS subnet."
  type        = string
}

variable "aks_subnet_address_name" {
  description = "The name of the AKS subnet."
  type        = string
}

# variable "acr_subnet_address_prefix" {
#   description = "The address prefix for the ACR subnet."
#   type        = string
# }

# variable "acr_subnet_address_name" {
#   description = "The name of the ACR subnet."
#   type        = string
# }

variable "storage_subnet_name" {
  description = "The name of the storage subnet."
  type        = string
}

variable "storage_subnet_address_prefix" {
  description = "The address prefix for the storage subnet."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the VNet."
  type        = map(string)
  default     = {}
}