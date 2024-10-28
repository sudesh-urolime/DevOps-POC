resource "azurerm_network_security_group" "nsg" {
  name                = "${var.environment}-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    environment = var.environment
  }
}