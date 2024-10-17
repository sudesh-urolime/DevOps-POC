variable "name" {
  type        = string
  description = "The name of the network security group."
}

variable "location" {
  type        = string
  description = "The location to deploy the NSG."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}
# variable "vnet_security_group_name" {
#     type = string
#     default = ""
#     description = "security group for vnet"
# }

# variable "nsg_settings" {
#   description = "A map containing the NSG settings for each instance"
#   type = map(object({
#     vnet_security_group_name = string
#     location                 = string
#     resource_group_name      = string
#   }))
# }
