provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}


module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = var.vnet_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  address_space       = var.address_space
  public_subnet_prefix = var.public_subnet_prefix
  private_subnet_prefix = var.private_subnet_prefix
}

module "public_ip" {
  source              = "./modules/public_ip_for_nat"
  public_ip_name      = "nat-gateway-ip"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
}

module "nat_gateway" {
  source              = "./modules/nat_gateway"
  nat_gateway_name    = "nat-gateway"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  public_ip_id        = module.public_ip.public_ip_id
  private_subnet_id   = module.vnet.private_subnet_id
}

module "aks" {
  source              = "./modules/private_aks"
  aks_name            = var.aks_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  dns_prefix          = var.dns_prefix
  private_subnet_id   = module.vnet.private_subnet_id
  node_count          = var.node_count
  vm_size             = var.vm_size
}

module "jump_host" {
  source              = "./modules/jump_host"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  public_subnet_id    = module.vnet.public_subnet_id 
  admin_password      = var.jump_host_password
}

module "key_vault" {
  source              = "./modules/key_vault"
  key_vault_name      = var.key_vault_name
  secret_name         = var.secret_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  admin_password      = var.jump_host_password
  soft_delete_retention_days = 14
  key_permissions           = ["Create", "Get", "List"]
  secret_permissions        = ["Set", "Get", "Delete", "Recover"]
}

module "acr" {
  source              = "./modules/acr"
  acr_name            = var.acr_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
}
