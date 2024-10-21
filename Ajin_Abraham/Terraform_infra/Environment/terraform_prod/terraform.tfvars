resource_group_name           = "project-3"
location                      = "southeastasia"
#-------------------------------------------------------------------------------------#
vnet_name                     = "prod-vm"
network_address_space         = ["10.2.0.0/16"]
aks_subnet_address_prefix     = "10.2.1.0/24"
aks_subnet_address_name       = "aks-subnet"
acr_subnet_address_prefix     = "10.2.2.0/24"
acr_subnet_address_name       = "acr-subnet"
storage_subnet_address_name   = "storage-subnet"
storage_subnet_address_prefix = "10.2.3.0/24"
#-------------------------------------------------------------------------------------#
registry_name                 = "urolimepocsouth"
admin_enabled                 = "false"
sku                           = "Standard"
public_network_access_enabled = "true"
#-------------------------------------------------------------------------------------#
cluster_name                  = "test" 
node_pool_type                = "VirtualMachineScaleSets" 
enable_auto_scaling           = "true" 
default_node_pool_name         = "default"
default_node_pool_vm_size      ="standard_b2ps_v2"
max_count                      = 3
min_count                      = 1 
os_disk_size_gb                = 30   
default_node_pool_zones        = [1, 2, 3]
nodepool-type                  = "system"
environment                    = "prod"
nodepoolos                     = "linux"
admin_username                 = "ubuntu" 
load_balancer_sku              = "standard"
network_plugin                 = "azure"

#-------------------------------------------------------------------------------------#    
vm_name                       = "bastion-server"
networkinterface_name         = "networkinterface_test"
pubip_name                    = "pubip_test"
allocation_method             = "Dynamic"
#ip_name                      ="internal"  
# storage_mb                  = 51200
#--------------------------------------------------------------------------------------#
log_analytics_workspace_name   = "log-analytics-workspace"


cosmosdb_name                       = "poc-db-azure-urolime"
cosmosdb_offer_type                 = "Standard"
cosmosdb_kind                       = "GlobalDocumentDB"
cosmosdb_automatic_failover_enabled = "false"
cosmosdb_consistency_level          = "BoundedStaleness"