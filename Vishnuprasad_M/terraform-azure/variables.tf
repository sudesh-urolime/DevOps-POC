############RESOURCE GROUP############
variable "rg-name" {
    type        = string
    description = "resource group name"
}
variable "location" {
    type    = string
    default = "eastus"
  
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
# variable "nsg_settings" {
#   description = "A map containing the NSG settings for each instance"
#   type = map(object({
#     vnet_security_group_name = string
#     location                 = string
#     resource_group_name      = string
#   }))
#   default = {}
# }

variable "vnet_security_group_name" {
    type        = string
    default     = ""
    description = "security group for vnet"
}

variable "nsg_rules" {
  description                 = "A map of security rules to be created."
  type                        = map(object({
    name                      = string
    priority                  = number
    direction                 = string
    access                    = string
    protocol                  = string
    source_port_range         = string
    destination_port_range    = string
    source_address_prefix     = string
    destination_address_prefix = string
  }))
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
########################


# variable "nsg_rules" {
#   description = "A map of NSG rules for each network security group"
#   type = map(object({
#     rules = map(object({
#       priority                    = number
#       direction                   = string
#       access                      = string
#       protocol                    = string
#       source_port_range           = string
#       destination_port_range      = string
#       source_address_prefix       = string
#       destination_address_prefix  = string
#     }))
#   }))
#   default = {}
# }

############
# variable "vent_sg_rule_name" {
#   description = "The name of the network security rule."
#   type        = string
# }

# variable "vent_sg_rule_priority" {
#   description = "The priority of the rule."
#   type        = number
# }

# variable "vent_sg_rule_direction" {
#   description = "The direction of the rule (Inbound/Outbound)."
#   type        = string
#   default     = "Outbound"
# }

# variable "vent_sg_rule_access" {
#   description = "The access type of the rule (Allow/Deny)."
#   type        = string
#   default     = "Allow"
# }

# variable "vent_sg_rule_protocol" {
#   description = "The protocol of the rule (Tcp/Udp/Asterisk)."
#   type        = string
#   default     = "Tcp"
# }

# variable "vent_sg_rule_source_port_range" {
#   description = "The source port range."
#   type        = string
#   default     = "*"
# }

# variable "vent_sg_rule_destination_port_range" {
#   description = "The destination port range."
#   type        = string
#   default     = "*"
# }

# variable "vent_sg_rule_source_address_prefix" {
#   description = "The source address prefix."
#   type        = string
#   default     = "*"
# }

# variable "vent_sg_rule_destination_address_prefix" {
#   description = "The destination address prefix."
#   type        = string
#   default     = "*"
# }