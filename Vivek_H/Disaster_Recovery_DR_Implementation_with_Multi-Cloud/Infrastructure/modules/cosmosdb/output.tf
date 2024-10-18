# Output the Private Endpoint Connections
output "cosmosdb_private_endpoint_id" {
  value = azurerm_private_endpoint.cosmosdb_private_endpoint.id
}

