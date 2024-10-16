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

# variable "nsg_settings" {
#   description = "A map containing the NSG settings for each instance"
#   type = map(object({
#     vnet_security_group_name = string
#     location                 = string
#     resource_group_name      = string
#   }))
# }
