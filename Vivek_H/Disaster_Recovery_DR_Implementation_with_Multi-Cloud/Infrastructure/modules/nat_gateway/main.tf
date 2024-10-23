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

# Route Table for NAT Gateway
resource "azurerm_route_table" "nat" {
  name                = "private-subnet-route-table"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Route to send traffic via NAT Gateway
resource "azurerm_route" "nat_gateway_route" {
  name                    = "nat-gateway-route"
  resource_group_name     = var.resource_group_name
  route_table_name        = azurerm_route_table.nat.name
  address_prefix          = "0.0.0.0/0"
  next_hop_type           = "Internet"
}

# Associate the Route Table with the Private Subnet
resource "azurerm_subnet_route_table_association" "private" {
  subnet_id      = var.private_subnet_id
  route_table_id = azurerm_route_table.nat.id
}

resource "azurerm_subnet_nat_gateway_association" "example" {
  subnet_id      = var.private_subnet_id
  nat_gateway_id = azurerm_nat_gateway.main.id
}