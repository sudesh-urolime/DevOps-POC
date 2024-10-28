output "aks_cluster_name" {
  value       = azurerm_kubernetes_cluster.aks-cluster.name
  description = "The name of the AKS cluster."
}

output "aks_cluster_id" {
  value       = azurerm_kubernetes_cluster.aks-cluster.id
  description = "The ID of the AKS cluster."
}

output "aks_cluster_command" {
  value       = "az aks get-credentials --resource-group ${azurerm_kubernetes_cluster.aks-cluster.resource_group_name} --name ${azurerm_kubernetes_cluster.aks-cluster.name}"
  description = "Command to configure kubectl to use the AKS cluster."
}