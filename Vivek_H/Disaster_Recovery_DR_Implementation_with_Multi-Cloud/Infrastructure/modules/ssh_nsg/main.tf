resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "allow_ssh_sg"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "117.219.142.7/32"
  }
}

resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id      = var.network_interface_id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
