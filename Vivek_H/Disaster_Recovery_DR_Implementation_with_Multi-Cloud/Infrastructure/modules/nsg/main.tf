# NSG Module

# Network Security Group for Public Subnet
resource "azurerm_network_security_group" "public_nsg" {
  name                = "public-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowSSHInbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowAccessToPrivateSubnet"
    priority                   = 200
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = var.private_subnet_prefix
  }
}

# Network Security Group for Private Subnet
resource "azurerm_network_security_group" "private_nsg" {
  name                = "private-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowPublicSubnetAccess"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = var.public_subnet_prefix
    destination_address_prefix = "*"
  }
}

# Associate the NSG with the Public Subnet
resource "azurerm_subnet_network_security_group_association" "public_nsg_assoc" {
  subnet_id                 = var.public_subnet_id
  network_security_group_id = azurerm_network_security_group.public_nsg.id
}

# Associate the NSG with the Private Subnet
resource "azurerm_subnet_network_security_group_association" "private_nsg_assoc" {
  subnet_id                 = var.private_subnet_id
  network_security_group_id = azurerm_network_security_group.private_nsg.id
}
