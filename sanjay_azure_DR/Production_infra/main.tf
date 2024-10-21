# resource "azurerm_resource_group" "main" {
#   name     = var.resource_group_name
#   location = var.location
#   tags = {
#     Environment   = "prod"
#     Resource_type = "resource_group"
#     Terraform     = "true"
#   }
# }

#====================vnet=========================================================

module "vnet" {
  source                    = "../modules/vnet" # Path to the vnet child module
  resource_group_name       = var.resource_group_name
  vnet_name                 = var.vnet_name
  location                  = var.location
  network_address_space     = var.network_address_space
  aks_subnet_address_prefix = var.aks_subnet_address_prefix
  aks_subnet_address_name   = var.aks_subnet_address_name
  # acr_subnet_address_prefix   = var.acr_subnet_address_prefix
  # acr_subnet_address_name     = var.acr_subnet_address_name
  storage_subnet_name           = var.storage_subnet_address_name
  storage_subnet_address_prefix = var.storage_subnet_address_prefix
}


################bastion###################################################

module "bastion" {
  source                = "../modules/bastion"
  vm_name               = var.vm_name
  resource_group_name = var.resource_group_name
  allocation_method     = var.allocation_method
  networkinterface_name = var.networkinterface_name
  pubip_name            = var.pubip_name
  location               = var.location
  storage_subnet_id = module.vnet.storage_subnet_id
  vm_size = var.vm_size
} 

###########################ACR######################

  module "ACR" {
    source              = "../modules/ACR"
    acr_name = var.acr_name
    resource_group_name = var.resource_group_name
    location            = var.location
  }
