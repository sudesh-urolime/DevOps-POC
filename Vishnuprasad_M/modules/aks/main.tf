resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                     = "${var.environment}-${var.name}"
  location                 = var.location
  resource_group_name     =  var.resource_group_name
  dns_prefix               = var.dns_prefix
  kubernetes_version       = var.kubernetes_version
   
  default_node_pool {
  name                  = "${var.environment}${var.default_node_pool_name}"
  vm_size               = var.default_node_pool_vm_size  
  auto_scaling_enabled  = var.enable_auto_scaling         
  max_count             = var.max_count                  
  min_count             = var.min_count
  node_count = 1                   
  os_disk_size_gb       = var.os_disk_size_gb            
  vnet_subnet_id        = var.aks_subnet_id
  type                  = var.node_pool_type               
  node_labels           = {
        "nodepool-type" = var.node_pool_type
        "nodepoolos"    =  var.node_pool_os
         } 
  upgrade_settings {
      max_surge                     = "10%"
      drain_timeout_in_minutes      = 0
      node_soak_duration_in_minutes = 0
    }
   }
    
    network_profile {
      network_plugin    = var.network_plugin                     
      load_balancer_sku = var.load_balancer_sku                                   
    } 
    private_cluster_enabled = true
    identity {
    type = "SystemAssigned"  # or "UserAssigned" for user-assigned identity
    }
  tags = {
    environment = var.environment
  }       
}