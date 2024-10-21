variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

#================vnet subnets  nat=================================

variable "vnet_name" {
  type = string
}

# variable "location" {
#   type = string
# }
variable "network_address_space" {
  description = "The network address space for the VNet"
  type        = list(string)
}
variable "aks_subnet_address_prefix" {
  type = string
}
variable "aks_subnet_address_name" {
  type = string
}
# variable "acr_subnet_address_prefix" {
#   type = string
# }
# variable "acr_subnet_address_name" {
#   type = string
# }
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



###########################bastion######################

# variable "resource_group_name" {
#   type = string
# }

# variable "location" {
#   type = string
# }

#variable "vnet_id" {
# type = string
#}

# variable "storage_subnet_id" {
#   type = string
# }
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
  type = string

}

# variable "ip_name" {
#   type = string
# }

variable "vm_size" {
  type = string
}

# variable "storage_subnet_id" {
#   type = string
# }