# resource "azurerm_network_security_group" "vnet_security_group" {
#   name                = var.vnet_security_group_name
#   location            = var.location
#   resource_group_name = var.resource_group_name
  
#   tags = {
#     Environment = "POC"
#   }
# }
resource "azurerm_network_security_group" "nsg" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    Environment = "POC"
  }
}
