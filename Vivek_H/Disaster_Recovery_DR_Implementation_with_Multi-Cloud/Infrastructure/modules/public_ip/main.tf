# Creates a Public IP resource
resource "azurerm_public_ip" "main" {
  name                = var.public_ip_names
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}
