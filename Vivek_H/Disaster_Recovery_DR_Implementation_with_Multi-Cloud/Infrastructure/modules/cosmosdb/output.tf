# Output the Private Endpoint Connections
output "cosmosdb_private_endpoint_name" {
  value = azurerm_private_endpoint.cosmosdb_private_endpoint.name
}

output "cosmosdb_private_endpoint" {
  value = azurerm_private_endpoint.cosmosdb_private_endpoint
}