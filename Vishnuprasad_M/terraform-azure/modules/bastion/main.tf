# Create an SSH key
resource "tls_private_key" "bastion_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create NIC configuration for target virtual machine
resource "azurerm_network_interface" "bastion_network_interface" {
  name                = var.bastion_network_interface_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.bastion_ip_config_name
    subnet_id                     = var.public_subnet_id
    private_ip_address_allocation = var.pvt_ip_allocation_net_int
  }
}

# Create the bastion virtual machine
resource "azurerm_linux_virtual_machine" "bastion_server" {
  name                  = var.bastion_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.bastion_network_interface.id]
  size                  = var.bastion_size
  os_disk {
    name                 = var.os_disk_name
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
  }
  source_image_reference {
    publisher = var.source_image_reference_publisher
    offer     = var.source_image_reference_offer
    sku       = var.source_image_reference_sku
    version   = var.source_image_reference_version
  }
  admin_username                  = var.bastion_user_name
  disable_password_authentication = var.disable_password_authentication

  admin_ssh_key {
    username   = var.bastion_user_name
    public_key = tls_private_key.bastion_ssh_key.public_key_openssh
  }
}