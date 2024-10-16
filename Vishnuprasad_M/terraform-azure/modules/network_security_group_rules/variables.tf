# variable "vnet_security_group_name" {
#   description = "The name of the VNET security group"
#   type        = string
# }

# variable "resource_group_name" {
#   description = "The name of the resource group"
#   type        = string
# }

# variable "nsg_rules" {
#   description = "The security rules to be applied to the NSG"
#   type = map(object({
#     priority                    = number
#     direction                   = string
#     access                      = string
#     protocol                    = string
#     source_port_range           = string
#     destination_port_range      = string
#     source_address_prefix       = string
#     destination_address_prefix  = string
#   }))
# }




variable "location" {
    type = string
    default = ""
    description = "resource location" 
}
variable "resource_group_name" {
    type = string
    default = ""
    description = "resource group name"
}
variable "vnet_security_group_name" {
    type = string
    default = ""
    description = "security group for vnet"
}
variable "vent_sg_rule_name" {
  description = "The name of the network security rule."
  type        = string
}

variable "vent_sg_rule_priority" {
  description = "The priority of the rule."
  type        = number
}

variable "vent_sg_rule_direction" {
  description = "The direction of the rule (Inbound/Outbound)."
  type        = string
  default     = "Outbound"
}

variable "vent_sg_rule_access" {
  description = "The access type of the rule (Allow/Deny)."
  type        = string
  default     = "Allow"
}

variable "vent_sg_rule_protocol" {
  description = "The protocol of the rule (Tcp/Udp/Asterisk)."
  type        = string
  default     = "Tcp"
}

variable "vent_sg_rule_source_port_range" {
  description = "The source port range."
  type        = string
  default     = "*"
}

variable "vent_sg_rule_destination_port_range" {
  description = "The destination port range."
  type        = string
  default     = "*"
}

variable "vent_sg_rule_source_address_prefix" {
  description = "The source address prefix."
  type        = string
  default     = "*"
}

variable "vent_sg_rule_destination_address_prefix" {
  description = "The destination address prefix."
  type        = string
  default     = "*"
}