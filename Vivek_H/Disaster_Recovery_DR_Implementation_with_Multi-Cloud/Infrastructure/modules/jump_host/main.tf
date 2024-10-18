# Create a virtual machine for the Jump Host
resource "azurerm_virtual_machine" "jump_host" {
  name                  = "jump-host"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.net_interface_id]
  vm_size               = "Standard_B2s"

  storage_os_disk {
    name              = "osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_profile {
    computer_name  = "jump-host"
    admin_username = "azureuser"
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}