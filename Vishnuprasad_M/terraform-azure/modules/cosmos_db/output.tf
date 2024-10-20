output "COSMOSDB_ENDPOINT" {
  description = "The endpoint of the CosmosDB Account"
  value       = azurerm_cosmosdb_account.cosmos-db-account.endpoint
}

output "COSMOSDB_PRIMARY_MASTER_KEY" {
  description = "The primary master key of the CosmosDB Account"
  value       = azurerm_cosmosdb_account.cosmos-db-account.primary_key
  sensitive   = true
}