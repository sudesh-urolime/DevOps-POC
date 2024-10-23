################VNET###################################################

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


#################BASTION###################################################

module "bastion" {
  source                = "../modules/bastion"
  vm_name               = var.vm_name
  resource_group_name   = var.resource_group_name
  allocation_method     = var.allocation_method
  networkinterface_name = var.networkinterface_name
  pubip_name            = var.pubip_name
  location              = var.location
  storage_subnet_id     = module.vnet.storage_subnet_id
  vm_size               = var.vm_size
}

################ACR###################################################

module "ACR" {
  source              = "../modules/ACR"
  acr_name            = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
}



################BLOB_STORAGE############################################

module "blob_storage" {
  source                         = "../modules/Blob_storage"
  blob_name                      = var.blob_name
  resource_group_name            = var.resource_group_name
  location                       = var.location
  account_tier                   = var.account_tier
  azurerm_storage_container_name = var.azurerm_storage_container_name
  container_access_type          = var.container_access_type
}


################AKS CLUSTER################################################


module "aks_cluster" {
  source                    = "../modules/AKS_cluster" # Path to the AKS child module
  resource_group_name       = var.resource_group_name
  location                  = var.location
  cluster_name              = var.cluster_name              # "test"
  default_node_pool_name    = var.default_node_pool_name    # "default"
  default_node_pool_vm_size = var.default_node_pool_vm_size #"standard_b2ps_v2"
  default_node_pool_zones   = var.default_node_pool_zones   # [1, 2, 3]
  enable_auto_scaling       = var.enable_auto_scaling       #  true
  max_count                 = var.max_count
  min_count                 = var.min_count
  os_disk_size_gb           = var.os_disk_size_gb #30
  node_pool_type            = var.node_pool_type  #"VirtualMachineScaleSets"
  aks_subnet_id             = module.vnet.aks_subnet_id
  node_labels = {                       # Node labels
    "nodepool-type" = var.nodepool-type # "system"
    "environment"   = var.environment   # "prod"
    "nodepoolos"    = var.nodepoolos    # "linux"
  }
  node_pool_tags = { # Node tags   
    "nodepool-type" = var.nodepool-type
    "environment"   = var.environment
    "nodepoolos"    = var.nodepoolos
  }
  nodepool-type     = var.nodepool-type     # "system"
  environment       = var.environment       #"prod"
  nodepoolos        = var.nodepoolos        #"linux"
  network_plugin    = var.network_plugin    #"azure"
  load_balancer_sku = var.load_balancer_sku # "standard"
  admin_username    = var.admin_username    #"ubuntu"
}


# # Module for NAT gateway public IP
# module "nat_public_ip" {
#   source              = "../modules/nat_publicip"
#   public_ip_names     = "nat-gateway-ip"
#   location            = var.location
#   resource_group_name = var.location
# }



# module "NATGATEWAY" {
#   source              = "../modules/Natgateway"
#   nat_gateway_name    = var.nat_gateway_name
#   location            = var.location
#   resource_group_name = var.location
#   public_ip_id        = module.nat_public_ip.public_ip_id
#   private_subnet_id   = module.vnet.aks_subnet_id
# }