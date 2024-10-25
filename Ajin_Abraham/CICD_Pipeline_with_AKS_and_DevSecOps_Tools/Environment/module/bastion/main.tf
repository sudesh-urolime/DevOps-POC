#----------------------------------------------------------------------------
#public ip creation for bastion vm
#----------------------------------------------------------------------------

resource "azurerm_public_ip" "bastionip" {
  name                = var.pubip_name
  location            = var.location                     
  resource_group_name = var.resource_group_name          
  allocation_method   = var.allocation_method            
}
#----------------------------------------------------------------------------
#net work interface
#----------------------------------------------------------------------------

resource "azurerm_network_interface" "bastionNI" {
  name                = var.networkinterface_name
  location            = var.location                         
  resource_group_name = var.resource_group_name              

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.acr_subnet_id         
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.bastionip.id
  }
}
#----------------------------------------------------------------------------
# vm creation (bastion)
#----------------------------------------------------------------------------
resource "azurerm_virtual_machine" "bastion" {
  name                  = var.vm_name
  location              = var.location                             
  resource_group_name   = var.resource_group_name                   
  network_interface_ids = [azurerm_network_interface.bastionNI.id]
  vm_size               = "Standard_DC1ds_v3"

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
    computer_name  = "hostname"
    admin_username = "ajin"
    
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      path     = "/home/ajin/.ssh/authorized_keys"
      key_data = file("~/.ssh/id_rsa.pub")
    }
  }
}
 