resource "azurerm_network_security_group" "vnet_security_group" {
  name                = var.vnet_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
  
  tags = {
    Environment = "POC"
  }
}
# resource "azurerm_network_security_group" "vnet_security_group" {
#   for_each            = var.nsg_settings
#   name                = each.value.vnet_security_group_name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name

#   tags = {
#     Environment = "POC"
#   }
# }
