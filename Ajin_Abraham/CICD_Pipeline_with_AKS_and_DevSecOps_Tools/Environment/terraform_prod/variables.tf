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

variable "cluster_name" {
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

# variable "storage_mb" {
#   type = number
# }

variable"log_analytics_workspace_name"{
  type = string
} 


variable "default_node_pool_name" {
  type = string
}
variable "default_node_pool_vm_size" {
  type = string
}

variable "default_node_pool_zones" {
  type = list(string)
}

variable "node_pool_type" {
  type = string
}

variable "enable_auto_scaling" {
  type = string
}

variable "max_count" {
  type = number
}

variable "min_count" {
  type = number
}

variable "os_disk_size_gb" {
  type = number
}

variable "nodepool-type"{
    type = string
}

variable "environment" {
  type    = string
}

variable "nodepoolos" {
  type = string
}

variable "network_plugin"{
  type = string
}

variable "load_balancer_sku" {
  type = string
}
variable "admin_username" {
  type = string
  
}

###########COSMOSDB##############
variable "cosmosdb_name" {
  type        = string
  description = "cosmosdb account name"
  default     = ""
}
variable "cosmosdb_offer_type" {
  type        = string
  description = "offer type for cosmosdb"
  default     = ""
}
variable "cosmosdb_kind" {
  type        = string
  description = "kind of cosmosdb"
  default     = ""
}
variable "cosmosdb_automatic_failover_enabled" {
  type        = string
  description = "automatic failover details"
  default     = ""
}
variable "cosmosdb_consistency_level" {
  type        = string
  description = "consistency level for cosmosdb"
  default     = ""
}