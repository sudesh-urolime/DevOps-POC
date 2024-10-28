variable "nsg_rules" {
  type = map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
    description                = string
  }))
  description = "NSG rules configuration"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "network_security_group_name" {
  type        = string
  description = "The name of the network security group."
}
variable "environment" {
  type =  string
  description = "environment which this service is deployed"
}