variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

######################VNET##########################

variable "vnet_name" {
  type = string
}

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



###########################BASTION###################

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


variable "vm_size" {
  type = string
}


##########################ACR###################

variable "acr_name" {
  type = string
}

###########################BLOB_STORAGE##########

variable "blob_name" {
  type = string
}


variable "account_tier" {
  type = string
}

variable "azurerm_storage_container_name" {
  type = string
}

variable "container_access_type" {
  type = string
}


###################AKS_CLUSTER######################

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
  type    = string
  default = "value"
}

###################NATPUBLIVIP######################


# variable "public_ip_names" {
#   description = "The name of the Public IP."
#   type        = string
# }



###################NATGATEWAY######################



variable "nat_gateway_name" {
  description = "The name of the NAT Gateway."
  type        = string
}

# variable "location" {
#   description = "The location for the NAT Gateway."
#   type        = string
# }

# variable "resource_group_name" {
#   description = "The name of the resource group where the NAT Gateway will be created."
#   type        = string
# }

# variable "public_ip_id" {
#   description = "The ID of the Public IP to associate with the NAT Gateway."
#   type        = string
# }

# variable "private_subnet_id" {
#   description = "The ID of the private subnet to associate with the NAT Gateway."
#   type        = string
# }

