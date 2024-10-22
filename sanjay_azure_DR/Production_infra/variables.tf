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


#############ACR##################
variable "acr_name" {
  type = string
}

# variable "resource_group_name" {
#   type = string
# }

# variable "location" {
#   type = string
# }


##############blob_storage################

variable "blob_name" {
  type = string
}

# variable "resource_group_name" {
#   type = string
# }

# variable "location" {
#   type = string
# }

variable "account_tier" {
  type = string
}

variable "azurerm_storage_container_name" {
  type = string
}

variable "container_access_type" {
  type = string
}


##############AKS##############################

# variable "resource_group_name" {
#   description = "The name of the resource group in which the VNet is created."
#   type        = string
# }

# variable "location" {
#   description = "The location/region where the Virtual Network is created."
#   type        = string
# }
###################################################


#################################################################



variable "cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "default_node_pool_name" {
  description = "The name of the default node pool."
  type        = string
}

variable "default_node_pool_vm_size" {
  description = "The size of the Virtual Machine for the default node pool."
  type        = string
}

variable "default_node_pool_zones" {
  description = "The availability zones for the default node pool."
  type        = list(number)
}

variable "enable_auto_scaling" {
  description = "Enable auto-scaling for the default node pool."
  type        = bool
}

variable "max_count" {
  description = "Maximum number of nodes for the default node pool when auto-scaling is enabled."
  type        = number
}

variable "min_count" {
  description = "Minimum number of nodes for the default node pool when auto-scaling is enabled."
  type        = number
}

variable "os_disk_size_gb" {
  description = "The size of the OS disk in GB for the default node pool."
  type        = number
}

variable "node_pool_type" {
  description = "The type of the node pool (e.g., 'VirtualMachineScaleSets')."
  type        = string
}

# variable "node_labels" {
#   description = "Labels for the default node pool."
#   type        = map(string)
# }

# variable "node_pool_tags" {
#   description = "Tags for the default node pool."
#   type        = map(string)
  
# }

#variable "ssh_public_key" {
#  description = "The SSH public key for authentication."
#  type        = string
#}

variable "network_plugin" {
  description = "The network plugin for the AKS cluster (e.g., 'azure')."
  type        = string
}

variable "load_balancer_sku" {
  description = "The SKU for the load balancer (e.g., 'standard')."
  type        = string
}

variable "admin_username" {
  description = "The admin username for the Linux profile."
  type        = string
}

variable "nodepool-type" {
  description = "The type of the node pool, e.g., 'system'."
  type        = string
}

variable "environment" {
  description = "The environment type, e.g., 'prod'."
  type        = string
}

variable "nodepoolos" {
  description = "The operating system of the node pool, e.g., 'linux'."
  type        = string
}
variable "aks_subnet_id" {
    type = string
    default = "value"
}

# variable "resource_group_name" {
#   description = "The name of the resource group in which the VNet is created."
#   type        = string
# }

# variable "location" {
#   description = "The location/region where the Virtual Network is created."
#   type        = string
# }