resource "azurerm_cosmosdb_account" "mongodb_account" {
  name                      = var.cosmosdb_account_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  offer_type                = "Standard"
  kind                      = "MongoDB"

  capabilities {
    name = "EnableMongo"
  }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 400
    max_staleness_prefix    = 200000
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  mongo_server_version = "4.2"
}

resource "azurerm_cosmosdb_mongo_database" "mongo_database" {
  name                = var.mongo_database_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.mongodb_account.name
  throughput          = 400
}

resource "azurerm_cosmosdb_mongo_collection" "mongo_collection" {
  name                = var.mongo_collection_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.mongodb_account.name
  database_name       = azurerm_cosmosdb_mongo_database.mongo_database.name

  default_ttl_seconds = 777
  shard_key           = var.uniqueKey
  throughput          = 400

  index {
    keys = ["_id"]
  }

  lifecycle {
    ignore_changes = [index]
  }

  depends_on = [azurerm_cosmosdb_mongo_database.mongo_database]
}

resource "azurerm_private_endpoint" "cosmosdb_private_endpoint" {
  name                = "cosmosdb-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_subnet_id

  private_service_connection {
    name                           = "cosmosdb-service-connection"
    private_connection_resource_id = azurerm_cosmosdb_account.mongodb_account.id
    is_manual_connection           = false
    subresource_names              = ["mongodb"]
  }
}