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
  cluster_name                   = var.cluster_name             
  default_node_pool_name         = var.default_node_pool_name   
  default_node_pool_vm_size      = var.default_node_pool_vm_size
  default_node_pool_zones        = var.default_node_pool_zones  
  enable_auto_scaling            = var.enable_auto_scaling      
  max_count                      = var.max_count
  min_count                      = var.min_count
  os_disk_size_gb                = var.os_disk_size_gb
  node_pool_type                 = var.node_pool_type            
  aks_subnet_id                  = module.vnet.aks_subnet_id
  node_labels = {                                               
    "nodepool-type"              = var.nodepool-type     
    "environment"                = var.environment              
    "nodepoolos"                 = var.nodepoolos       
      }
  node_pool_tags = {                                             
    "nodepool-type"              = var.nodepool-type
    "environment"                = var.environment
    "nodepoolos"                 = var.nodepoolos
  }
  nodepool-type                   = var.nodepool-type             
  environment                     = var.environment                
  nodepoolos                      = var.nodepoolos                 
  network_plugin                  = var .network_plugin             
  load_balancer_sku               = var.load_balancer_sku 
  admin_username                  = var.admin_username         
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
  acr_subnet_id           =   module.vnet.acr_subnet_id
  }

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
  cosmosdb_name              = var.cosmosdb_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  offer_type                 = var.cosmosdb_offer_type
  storage_subnet_id          = module.vnet.storage_subnet_id
  vnet_id                    = module.vnet.vnet_id
  kind                       = var.cosmosdb_kind
  automatic_failover_enabled = var.cosmosdb_automatic_failover_enabled
  consistency_level          = var.cosmosdb_consistency_level
  }
