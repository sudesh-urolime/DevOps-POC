# Creates a Public IP resource
resource "azurerm_public_ip" "main" {
  name                = var.public_ip_names
  location            = "centralindia"
  resource_group_name = "Dr_azure_poc"
  allocation_method   = "Static"
  sku                 = "Standard"
}