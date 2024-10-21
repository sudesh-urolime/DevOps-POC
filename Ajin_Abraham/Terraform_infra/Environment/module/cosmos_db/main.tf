resource "azurerm_cosmosdb_account" "cosmos-db-account" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = var.offer_type
  kind                = var.kind
  automatic_failover_enabled = var.automatic_failover_enabled
  geo_location {
    location          = var.location
    failover_priority = 0
  }
  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }
}  