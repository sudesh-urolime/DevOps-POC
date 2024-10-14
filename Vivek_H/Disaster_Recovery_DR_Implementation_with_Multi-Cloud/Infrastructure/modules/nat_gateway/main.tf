# Create a NAT Gateway
resource "azurerm_nat_gateway" "main" {
  name                = var.nat_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "Standard"
}

# Associate the NAT Gateway with the provided Public IP
resource "azurerm_nat_gateway_public_ip_association" "example" {
  nat_gateway_id       = azurerm_nat_gateway.main.id
  public_ip_address_id = var.public_ip_id
}