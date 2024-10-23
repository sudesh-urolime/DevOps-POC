#----------------------------------------------------------------------------
#public ip creation for bastion vm
#----------------------------------------------------------------------------

resource "azurerm_public_ip" "bastionip" {
  name                = var.pubip_name
  location            = var.location                                  #azurerm_resource_group.example.location
  resource_group_name = var.resource_group_name                       #azurerm_resource_group.example.name
  allocation_method   = var.allocation_method                         #"Dynamic"
}
#----------------------------------------------------------------------------
#net work interface
#----------------------------------------------------------------------------

resource "azurerm_network_interface" "bastionNI" {
  name                = var.networkinterface_name
  location            = var.location                                    #azurerm_resource_group.example.location
  resource_group_name = var.resource_group_name                         #azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.storage_subnet_id               #azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.bastionip.id
  }

  
}

#----------------------------------------------------------------------------
# vm creation (bastion)
#----------------------------------------------------------------------------
resource "azurerm_virtual_machine" "bastion" {
  name                  = var.vm_name
  location              = var.location                                 #azurerm_resource_group.example.location
  resource_group_name   = var.resource_group_name                      #azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.bastionNI.id]
  vm_size               = var.vm_size

  storage_os_disk {
    name              = "prod-os-dis"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18_04-lts-gen2"
    version   = "18.04.202205270"
  }

  os_profile {
    computer_name  = "ubuntu"
    admin_username = "sanjay"
    
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      path     = "/home/sanjay/.ssh/authorized_keys"
      key_data = file("~/.ssh/id_rsa.pub")
    }
  }
}
 