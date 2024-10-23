output "cosmosdb_private_endpoint_name" {
    description = "Cosmosdb endpoint name"
  value = module.cosmosdb.cosmosdb_private_endpoint_name
}

output "cosmosdb_private_endpoint" {
    description = "cosmosdb endpoint"
  value = module.cosmosdb.cosmosdb_private_endpoint
}

output "acr_name" {
    description = "acr name"
  value = module.acr.acr_name
}

output "jump_host_public_ip" {
    description = "jumphost publicip"
  value = module.jump_host_public_ip.public_ip_address
}

output "aks_name" {
    description = "aks name"
  value = module.aks.aks_name
}