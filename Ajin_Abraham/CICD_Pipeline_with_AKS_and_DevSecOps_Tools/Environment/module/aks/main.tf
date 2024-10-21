data "azurerm_kubernetes_service_versions" "current" {
  location = var.location
  include_preview = false
}
#-----------------------------------------------------------------------------------
# aks cluster creation
#----------------------------------------------------------------------------------
resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                     = var.cluster_name                 
  location                 = var.location
  resource_group_name     =  var.resource_group_name
  dns_prefix               = "${var.resource_group_name}-cluster"
  kubernetes_version       = data.azurerm_kubernetes_service_versions.current.latest_version
   
  default_node_pool {
  name                = var.default_node_pool_name
  vm_size             = var.default_node_pool_vm_size  
  zones               = var.default_node_pool_zones    
  enable_auto_scaling = var.enable_auto_scaling        
  max_count           = var.max_count                  
  min_count           = var.min_count                   
  os_disk_size_gb     = var.os_disk_size_gb            
  vnet_subnet_id      = var.aks_subnet_id
  type                = var.node_pool_type               
  node_labels      = {
        "nodepool-type" = var.nodepool-type
        "environment"   = var.environment
        "nodepoolos"  =  var.nodepoolos
         }
  tags = {
        "nodepool-type"   = var.nodepool-type 
        "environment"     = var.environment 
        "nodepoolos"       = var.nodepoolos 
          } 
   }
    
    network_profile {
      network_plugin = var.network_plugin                     
      load_balancer_sku = var.load_balancer_sku                                   
    } 
    private_cluster_enabled = true
    identity {
    type = "SystemAssigned"  # or "UserAssigned" for user-assigned identity
  }       
}

# resource "azurerm_role_assignment" "acr_pull" {
#   scope                = var.acr_id
#   role_definition_name = "AcrPull"
#   principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
# }