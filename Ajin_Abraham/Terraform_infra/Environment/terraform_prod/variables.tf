variable "resource_group_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "location" {
  type = string
}
variable "network_address_space" {
  description = "The network address space for the VNet"
  type        = list (string)
}
variable "aks_subnet_address_prefix" {
  type = string
}
variable "aks_subnet_address_name" {
  type = string
}
variable "acr_subnet_address_prefix" {
  type = string
}
variable "acr_subnet_address_name" {
  type = string
}
variable "storage_subnet_address_name" {
  type = string
}
variable "storage_subnet_address_prefix" {
  type = string
}
variable "tags" {
  description = "A map of tags to assign to the VNet."
  type        = map(string)
  default     = {}
}

variable "registry_name" {
  type = string
}

variable "admin_enabled" {
  type = string
}

variable "sku" {
  description = "The SKU tier for this Container Registry. Value must be \"Basic\", \"Standard\" or \"Premium\"."
  type        = string
  }

variable "public_network_access_enabled" {
  description = "Should public network access be enabled for this Container Registry?"
  type        = bool
 # default     = true
 # nullable    = false
}

variable "aks_name" {
  type = string
}

variable "vm_name" {
    type = string
  
}
variable "networkinterface_name" {
    type = string
  
}

variable "pubip_name" {
  type = string
}

variable "allocation_method" {
  type =  string
}
#  variable "ip_name" {
#    type = string
#  }

variable "storage_mb" {
  type = number
}