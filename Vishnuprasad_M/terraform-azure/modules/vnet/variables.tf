variable "location" {
  type        = string
  description = "Resource location"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "vnet_name" {
  type        = string
  description = "VNet name"
}

variable "vnet_cidr" {
  type        = string
  description = "VNet CIDR for Azure"
}

variable "subnets" {
  description = "List of subnets with their configurations"
  type = list(object({
    name                    = string
    address_prefixes        = list(string)
    nat_gateway_enabled     = bool
    private_endpoint_status = string // "Enabled", "Disabled", or "null"
  }))
}

variable "vnet_nat_gw_ip_name" {
  type        = string
  description = "VNet NAT gateway IP name"
}

variable "vnet_nat_gw_name" {
  type        = string
  description = "VNet NAT gateway name"
}
variable "network_security_group_id_private" {
    type = string
    description = "private network security group id"
}
variable "network_security_group_id_public" {
    type = string
    description = "public network security group id"
}