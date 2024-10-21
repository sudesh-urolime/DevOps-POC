# Create Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = var.log_analytics_workspace_name 
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.log_analytics_sku
  retention_in_days   = var.retention_in_days
}

#Reference to existing AKS Cluster
data "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.cluster_name
  resource_group_name = var.resource_group_name
}

# Connect AKS to Log Analytics Workspace
resource "azurerm_monitor_diagnostic_setting" "aks_diagnostic" {
  name                     = var.diagnostic_setting_name
  target_resource_id        = data.azurerm_kubernetes_cluster.aks_cluster.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics.id

  dynamic "log" {
    for_each = var.logs
    content {
      category = log.value.category
      enabled  = log.value.enabled
    }
  }

  dynamic "metric" {
    for_each = var.metrics
    content {
      category = metric.value.category
      enabled  = metric.value.enabled
    }
  }
}
