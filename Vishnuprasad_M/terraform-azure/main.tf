resource "azurerm_resource_group" "poc-rg" {
    name     = var.rg-name
    location = var.location
}

module "public_nsg" {
  source              = "./modules/network_security_group"
  name                = var.public_nsg_name
  location            = var.location
  resource_group_name = var.rg-name
}

module "private_nsg" {
  source              = "./modules/network_security_group"
  name                = var.private_nsg_name
  location            = var.location
  resource_group_name = var.rg-name
}

module "nsg_rules_public" {
  source                      = "./modules/network_security_group_rules"
  nsg_rules                   = var.public_nsg_rules
  resource_group_name         = var.rg-name
  network_security_group_name = var.public_nsg_name
  depends_on                  = [ module.public_nsg ]
}

module "nsg_rules_private" {
  source                      = "./modules/network_security_group_rules"
  nsg_rules                   = var.private_nsg_rules
  resource_group_name         = var.rg-name
  network_security_group_name = var.private_nsg_name
  depends_on                  = [ module.private_nsg ]
}

module "vnet" {
  source                            = "./modules/vnet"
  location                          = var.location
  resource_group_name               = azurerm_resource_group.poc-rg.name
  vnet_name                         = var.vnet_name
  vnet_cidr                         = var.vnet_cidr
  subnets                           = var.subnets
  vnet_nat_gw_ip_name               = var.vnet_nat_gw_ip_name
  vnet_nat_gw_name                  = var.vnet_nat_gw_name
  network_security_group_id_private = module.private_nsg.nsg_id
  network_security_group_id_public  = module.public_nsg.nsg_id
  depends_on                        = [azurerm_resource_group.poc-rg, module.public_nsg, module.private_nsg]
}

module "bastion" {
  source                           = "./modules/bastion"
  bastion_network_interface_name   = var.bastion_network_interface_name
  bastion_ip_config_name           = var.bastion_ip_config_name
  bastion_name                     = var.bastion_name
  bastion_size                     = var.bastion_size
  bastion_user_name                = var.bastion_user_name
  resource_group_name              = var.rg-name
  os_disk_caching                  = var.os_disk_caching
  os_disk_name                     = var.os_disk_name
  os_disk_storage_account_type     = var.os_disk_storage_account_type
  public_subnet_id                 =  module.vnet.public_subnet_id
  pvt_ip_allocation_net_int        =  var.pvt_ip_allocation_net_int
  disable_password_authentication  =  var.disable_password_authentication
  source_image_reference_offer     =  var.source_image_reference_offer
  source_image_reference_publisher =  var.source_image_reference_publisher
  source_image_reference_sku       =  var.source_image_reference_sku
  source_image_reference_version   =  var.source_image_reference_version
  location                         = var.location
  depends_on                       = [ module.vnet ]
}

module "aks" {
  source                    = "./modules/aks"
  name                      = var.aks_name                  
  location                  = var.location
  resource_group_name       = var.rg-name
  dns_prefix                = var.dns_prefix
  kubernetes_version        = var.kubernetes_version
  default_node_pool_name    = var.default_node_pool_name
  default_node_pool_vm_size = var.default_node_pool_vm_size
  zones                     = var.node_pool_zones
  enable_auto_scaling       = var.enable_auto_scaling
  max_count                 = var.max_node_count
  min_count                 = var.min_node_count
  os_disk_size_gb           = var.os_disk_size_gb
  aks_subnet_id             = module.vnet.private_subnet_id
  node_pool_type            = var.node_pool_type
  node_pool_os              = var.node_pool_os
  network_plugin            = var.network_plugin
  load_balancer_sku         = var.load_balancer_sku
  depends_on                = [ module.vnet ] 
}
module "acr" {
  source = "./modules/acr"
  name                = var.acr_name
  location            = var.location
  resource_group_name = var.rg-name
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
}

