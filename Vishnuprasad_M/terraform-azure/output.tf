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
# output "module_bastion_public_key" {
#   value = module.bastion.public_key
#   sensitive = true
# }

# output "module_bastion_private_key" {
#   value = module.bastion.private_key
#   sensitive = true
# }

# output "module_bastion_private_key_path" {
#   value = module.bastion.private_key_path
#   sensitive = true
# }

# output "module_bastion_public_key_path" {
#   value = module.bastion.public_key_path
# }