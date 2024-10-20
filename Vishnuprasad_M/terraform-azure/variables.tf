############RESOURCE GROUP############
variable "rg-name" {
    type        = string
    description = "resource group name"
}
variable "location" {
    type    = string
    default = ""
  
}
################VNET#####################
variable "vnet_name" {
    type        = string
    default     = ""
    description = "vnet name"
}
variable "vnet_cidr" {
    type        = string
    default     = ""
    description = "vnet cidr for azure"
}
variable "subnets" {
  description               = "List of subnets with configurations"
  type                      = list(object({
    name                    = string
    address_prefixes        = list(string)
    private_endpoint_status = string // "Enabled", "Disabled", or "null"
    nat_gateway_enabled     = bool
  }))
}
variable "vnet_nat_gw_ip_name" {
    type        = string
    default     = ""
    description = "vnet nat gateway ip name"
}
variable "vnet_nat_gw_name" {
    type        = string
    default     = ""
    description = "vnet nat gateway name" 
}

################NETWORK SECURITY GROUP#################

# variable "vnet_security_group_name" {
#     type        = string
#     default     = ""
#     description = "security group for vnet"
# }

# variable "nsg_rules" {
#   description                 = "A map of security rules to be created."
#   type                        = map(object({
#     name                      = string
#     priority                  = number
#     direction                 = string
#     access                    = string
#     protocol                  = string
#     source_port_range         = string
#     destination_port_range    = string
#     source_address_prefix     = string
#     destination_address_prefix = string
#   }))
# }
variable "public_nsg_name" {
  description = "Name for the public NSG"
  type        = string
}

variable "private_nsg_name" {
  description = "Name for the private NSG"
  type        = string
}
variable "public_nsg_rules" {
  description = "Rules for the public network security group"
  type        = map(any)
}

variable "private_nsg_rules" {
  description = "Rules for the private network security group"
  type        = map(any)
}

##############BASTION###########
variable "pvt_ip_allocation_net_int" {
  type = string
  description = "private ip address allocation Enabled/Disabled"
}
# variable "public_subnet_id" {
#   type = string
#   description = "public subnet id for the instance"
# }
variable "bastion_ip_config_name" {
  type = string
  description = "name for bastion_ip_config"
}
variable "bastion_network_interface_name" {
  type = string
  description = "name for bastion_network_interface"
}
variable "bastion_name" {
  type = string
  description = "bastion name"
}
variable "bastion_size" {
  type = string
  description = "bastion machine size"
}
variable "os_disk_name" {
  type = string
  description = "os_disk_name"
}
variable "os_disk_caching" {
  type = string
  description = "os_disk_caching"
}
variable "os_disk_storage_account_type" {
  type = string
  description = "os_disk_storage_account_type"
}
variable "source_image_reference_publisher" {
  type = string
  description = "source_image_reference_publisher"
}
variable "source_image_reference_offer" {
  type = string
  description = "source_image_reference_offer"
}
variable "source_image_reference_sku" {
  type = string
  description = "source_image_reference_sku"
}
variable "source_image_reference_version" {
  type = string
  description = "source_image_reference_version"
}
variable "bastion_user_name" {
  type = string
  description = "bastion_user_name"
}
variable "disable_password_authentication" {
  type = string
  description = "disable_password_authentication"
}
####################AKS#####################
variable "aks_name" {
  description = "name for the aks cluster"
  type = string
  default = ""
}
variable "kubernetes_version" {
  description = "kubernetes verion used"
  type = string
  default = ""
}
variable "dns_prefix" {
  description = "dns prefix for the cluster"
  type = string
  default = ""
}
variable "default_node_pool_name" {
  description = "default node pool name"
  type = string
  default = ""
}
variable "default_node_pool_vm_size" {
  description = "default node pool vm size of the cluster"
  type = string
  default = ""
}
variable "node_pool_zones" {
  description = "default node pool zone"
  type = list(number)
}
variable "enable_auto_scaling" {
    type = string
    description = "enable auto scaling of the nodes"
    default = ""
}
variable "max_node_count" {
  type = string
  description = "maximum node count"
  default = ""
}
variable "min_node_count" {
  type = string
  description = "minimum count of nodes"
  default = ""
}
variable "os_disk_size_gb" {
  description = "os disk size needed"
  type = string
  default = ""
}
variable "aks_subnet_id" {
  description = "subnet id for the cluster"
  type = string
  default = ""
}
variable "node_pool_type" {
  description = "node pool type used"
  type = string
  default = ""
}
variable "node_pool_os" {
  description = "value"
  type = string
  default = ""
}
variable "network_plugin" {
  description = "network plugin used"
  type = string
  default = ""
}
variable "load_balancer_sku" {
  description = "loadbalancer sku"
  type = string
  default = ""
}
##############ACR#############
variable "acr_name" {
    type = string
    description = "name for acr"
    default = "" 
}
variable "acr_sku" {
    type = string
    description = "sku used for acr"
    default = "" 
}
variable "acr_admin_enabled" {
    type = string
    description = "admin enabled for acr"
    default = "" 
}