resource "azurerm_resource_group" "poc-rg" {
    name = var.rg-name
    location = var.location
}

module "network_security_group" {
    source = "./modules/network_security_group"
    vnet_security_group_name = var.vnet_security_group_name
    location                                 = var.location
    resource_group_name                      = azurerm_resource_group.poc-rg.name
}

module "nsg_rules" {
    source = "./modules/network_security_group_rules"
    for_each                  = var.nsg_rules
    vnet_security_group_name                 = var.vnet_security_group_name
    resource_group_name                      = azurerm_resource_group.poc-rg.name
    vent_sg_rule_name                        = each.value.name
    vent_sg_rule_priority                    = each.value.priority
    vent_sg_rule_direction                   = each.value.direction
    vent_sg_rule_access                      = each.value.access
    vent_sg_rule_protocol                    = each.value.protocol
    vent_sg_rule_source_port_range           = each.value.source_port_range
    vent_sg_rule_destination_port_range      = each.value.destination_port_range
    vent_sg_rule_source_address_prefix       = each.value.source_address_prefix
    vent_sg_rule_destination_address_prefix  = each.value.destination_address_prefix
    depends_on = [module.network_security_group]
}

module "vnet" {
  source              = "./modules/vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.poc-rg.name
  vnet_name           = var.vnet_name
  vnet_cidr           = var.vnet_cidr
  subnets             = var.subnets
  vnet_nat_gw_ip_name = var.vnet_nat_gw_ip_name
  vnet_nat_gw_name    = var.vnet_nat_gw_name
  network_security_group_id_private = module.network_security_group.nsg_id
  depends_on = [azurerm_resource_group.poc-rg, module.network_security_group]
}

module "bastion" {
  source = "./modules/bastion"
  bastion_network_interface_name = var.bastion_network_interface_name
  bastion_ip_config_name = var.bastion_ip_config_name
  bastion_name = var.bastion_name
  bastion_size = var.bastion_size
  bastion_user_name = var.bastion_user_name
  resource_group_name = var.rg-name
  os_disk_caching = var.os_disk_caching
  os_disk_name = var.os_disk_name
  os_disk_storage_account_type = var.os_disk_storage_account_type
  public_subnet_id =  module.vnet.public_subnet_id
  pvt_ip_allocation_net_int =  var.pvt_ip_allocation_net_int
  disable_password_authentication =  var.disable_password_authentication
  source_image_reference_offer =  var.source_image_reference_offer
  source_image_reference_publisher =  var.source_image_reference_publisher
  source_image_reference_sku =  var.source_image_reference_sku
  source_image_reference_version =  var.source_image_reference_version
  location = var.location
  depends_on = [ module.vnet ]
}

# module "network_security_group" {
#   source = "./modules/network_security_group"
#   for_each = var.nsg_settings

#   vnet_security_group_name = each.value.vnet_security_group_name
#   location                 = each.value.location
#   resource_group_name      = each.value.resource_group_name
# }
# module "network_security_group" {
#   source = "./modules/network_security_group"
#   nsg_settings = var.nsg_settings
# }
# module "network_security_group_rules" {
#   source = "./modules/network_security_group_rules"
#   for_each = var.nsg_rules

#   vnet_security_group_name = each.key
#   resource_group_name      = var.rg-name #module.network_security_group[each.key].resource_group_name
#   rules                    = each.value.rules
# }


# module "vnet" {
#   source              = "./modules/vnet"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.poc-rg.name
#   vnet_name           = var.vnet_name
#   vnet_cidr           = var.vnet_cidr
#   subnets             = var.subnets
#   vnet_nat_gw_ip_name = var.vnet_nat_gw_ip_name
#   vnet_nat_gw_name    = var.vnet_nat_gw_name
#   network_security_group_id_private = module.network_security_group.private_nsg_id
# #   network_security_group_id_public = module.network_security_group.public_nsg_id
# #   network_security_group_id_private = module.network_security_group.nsg_ids["nsg2"]
# #   network_security_group_id_public  = module.network_security_group.nsg_ids["nsg1"]
#   depends_on = [azurerm_resource_group.poc-rg]
# }



