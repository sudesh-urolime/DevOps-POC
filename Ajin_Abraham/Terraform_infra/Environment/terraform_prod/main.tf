#---------------------------------------------------------------------------------
# creating resource group
#---------------------------------------------------------------------------------  
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    Environment   = "prod"
    Resource_type = "resource_group"
    Terraform     = "true"
  }
}

#-----------------------------------------------------------------------------------
#VNet, Subnet selection
#-----------------------------------------------------------------------------------
module "vnet" {
  source                      ="../module/vnet" # Path to the vnet child module
  resource_group_name         = azurerm_resource_group.main.name 
  vnet_name                   = var.vnet_name
  location                    = var.location
  network_address_space       = var.network_address_space 
  aks_subnet_address_prefix   = var.aks_subnet_address_prefix
  aks_subnet_address_name     = var.aks_subnet_address_name
  acr_subnet_address_prefix   = var.acr_subnet_address_prefix
  acr_subnet_address_name     = var.acr_subnet_address_name
  storage_subnet_name         = var.storage_subnet_address_name
  storage_subnet_address_prefix = var.storage_subnet_address_prefix
  }

 #------------------------------------------------------------------------------
 # creating ACR 
 # note its public. Private subnet is available for premimum account
 #------------------------------------------------------------------------------- 
module "acr" {
  source                     = "../module/acr" # Path to the acr child module
  registry_name              = var.registry_name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  admin_enabled              = var.admin_enabled 
  sku                        = var.sku
  public_network_access_enabled = var.public_network_access_enabled
  }

#------------------------------------------------------------------------------
 # creating aks
 # created under aks_subnet with public ip disabled
 #-------------------------------------------------------------------------------
module "aks_cluster" {
  source                         = "../module/aks"              # Path to the AKS child module
  resource_group_name            = var.resource_group_name
  location                       = var.location
  cluster_name                   = var.cluster_name             # "test"
  default_node_pool_name         = var.default_node_pool_name    # "default"
  default_node_pool_vm_size      = var.default_node_pool_vm_size #"standard_b2ps_v2"
  default_node_pool_zones        = var.default_node_pool_zones   # [1, 2, 3]
  enable_auto_scaling            = var.enable_auto_scaling       #  true
  max_count                      = var.max_count
  min_count                      = var.min_count
  os_disk_size_gb                = var.os_disk_size_gb #30
  node_pool_type                 = var.node_pool_type            #"VirtualMachineScaleSets"
  aks_subnet_id                  = module.vnet.aks_subnet_id
  node_labels = {                                                # Node labels
    "nodepool-type"              = var.nodepool-type      #       "system"
    "environment"                = var.environment                       #         "prod"
    "nodepoolos"                 = var.nodepoolos        # "linux"
      }
  node_pool_tags = {                                             # Node tags   
    "nodepool-type"              = var.nodepool-type
    "environment"                = var.environment
    "nodepoolos"                 = var.nodepoolos
  }
  nodepool-type                   = var.nodepool-type              # "system"
  environment                     = var.environment                 #"prod"
  nodepoolos                      = var.nodepoolos                  #"linux"
  network_plugin                  = var .network_plugin              #"azure"
  load_balancer_sku               = var.load_balancer_sku # "standard"
  admin_username                  = var.admin_username         #"ubuntu"
}

#------------------------------------------------------------------------------
 # creating bastion (vm)
 # created under acr_subnet with public ip enabled
 #-------------------------------------------------------------------------------
module "bastion" {
  source              = "../module/bastion"
  resource_group_name = azurerm_resource_group.main.name # Path to the bastion child module
  vm_name             = var.vm_name
  allocation_method   = var.allocation_method
  networkinterface_name = var.networkinterface_name
  pubip_name            = var.pubip_name
  location              = var.location
  acr_subnet_id           =    module.vnet.acr_subnet_id
  }
#------------------------------------------------------------------
# mysql creation
#-------------------------------------------------------------------
# module "mysql_server" {
#   source = "../module/mysql"
#   mysql_server_name        = "my-flexible-mysql"
#   resource_group_name       = var.resource_group_name
#   admin_username            = "mysqladmin"
#   admin_password           = "MyStrongPassword123!"
#   sku_name                 = "Standard_B1ms"
#   mysql_version            = "8.0.21"
#   storage_mb              = var.storage_mb
#   backup_retention_days     = 7
#   geo_redundant_backup_enabled = false
#   location                 = var.location
#   storage_subnet_id        = module.vnet.storage_subnet_id
#   environment              = "Development"
# } 

#------------------------------------------------------------------------------------
# creating log analytics for aks logs.
#-------------------------------------------------------------------------------------
module "aks_monitoring" {
  source = "../module/monitor"  # Or use a remote source such as a GitHub repository

  log_analytics_workspace_name = var.log_analytics_workspace_name                               #"log-analytics-workspace"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  cluster_name                 = var.cluster_name  #"test"
  depends_on = [
    module.aks_cluster
  ]
}

#------------------------------------------------------------------------------------------
# cosmosdb creation
#-------------------------------------------------------------------------------------------

module "cosmosdb" {
  source                     = "../module/cosmos_db"
  name                       = var.cosmosdb_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  offer_type                 = var.cosmosdb_offer_type
  kind                       = var.cosmosdb_kind
  automatic_failover_enabled = var.cosmosdb_automatic_failover_enabled
  consistency_level          = var.cosmosdb_consistency_level
}
