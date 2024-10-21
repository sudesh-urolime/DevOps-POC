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

# Module for Jump Host public IP
module "jump_host_public_ip" {
  source              = "./modules/public_ip"
  public_ip_names     = "jump-host-ip"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
}

module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = var.vnet_name
  network_interface_name = var.network_interface_name 
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  address_space       = var.address_space
  public_ip           = module.jump_host_public_ip.public_ip_id
  public_subnet_prefix = var.public_subnet_prefix
  private_subnet_prefix = var.private_subnet_prefix
}

# Module for NAT gateway public IP
module "nat_public_ip" {
  source              = "./modules/public_ip"
  public_ip_names     = "nat-gateway-ip"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
}


module "nat_gateway" {
  source              = "./modules/nat_gateway"
  nat_gateway_name    = "nat-gateway"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  public_ip_id        = module.nat_public_ip.public_ip_id
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

module "cosmosdb" {
  source              = "./modules/cosmosdb"
  cosmosdb_account_name = var.cosmosdb_account_name
  mongo_database_name  = var.mongo_database_name
  mongo_collection_name = var.mongo_collection_name
  location            = module.resource_group.location
  uniqueKey           = var.uniqueKey
  resource_group_name = module.resource_group.name
  private_subnet_id   = module.vnet.private_subnet_id
}


module "network_security_group" {
  source = "./modules/ssh_nsg"

  nsg_name            = "ssh_nsg"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  network_interface_id = module.vnet.network_interface_id
}

module "jump_host" {
  source              = "./modules/jump_host"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  net_interface_id    = module.vnet.network_interface_id
  admin_password      = var.jump_host_password
}

module "key_vault" {
  source              = "./modules/key_vault"
  key_vault_name      = var.key_vault_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  soft_delete_retention_days = 14
  key_permissions           = ["Create", "Get", "List"]
  secret_permissions        = ["Set", "Get", "Delete", "Recover"]
}

module "jumb_host_key_vault_secret" {
  source = "./modules/key_vault_secret"
  secret_name = var.secret_name
  secret_value = var.jump_host_password
  key_vault_id = module.key_vault.key_vault_id
}

module "cosmosdb_key_vault_secret" {
  source = "./modules/key_vault_secret"
  secret_name = var.cosmos_secret_name
  secret_value = var.uniqueKey
  key_vault_id = module.key_vault.key_vault_id
}

module "acr" {
  source              = "./modules/acr"
  acr_name            = var.acr_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
}
