output "cosmos_db_endpoint" {
  description = "The endpoint of the CosmosDB Account"
  value       = azurerm_cosmosdb_account.cosmos-db-account.endpoint
}

output "cosmos_db_primary_master_key" {
  description = "The primary master key of the CosmosDB Account"
  value       = azurerm_cosmosdb_account.cosmos-db-account.primary_key
  sensitive   = true
}