output "root_aks_cluster_name" {
  value       = module.aks.aks_cluster_name
  description = "The name of the AKS cluster at the root level."
}

output "root_aks_cluster_id" {
  value       = module.aks.aks_cluster_id
  description = "The ID of the AKS cluster at the root level."
}

output "root_aks_cluster_command" {
  value       = module.aks.aks_cluster_command
  description = "Command to configure kubectl to use the AKS cluster at the root level."
}