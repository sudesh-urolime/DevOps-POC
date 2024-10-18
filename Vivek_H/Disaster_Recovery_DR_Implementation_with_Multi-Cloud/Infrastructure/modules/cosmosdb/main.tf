resource "azurerm_cosmosdb_account" "mongodb_account" {
  name                = var.cosmosdb_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "MongoDB"
  
  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  capabilities {
    name = "EnableMongo"
  }

  mongo_server_version = "4.0"
}

resource "azurerm_cosmosdb_mongo_database" "mongo_database" {
  name                = var.mongo_database_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.mongodb_account.name
}

resource "azurerm_cosmosdb_mongo_collection" "mongo_collection" {
  name                = var.mongo_collection_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.mongodb_account.name
  database_name       = azurerm_cosmosdb_mongo_database.mongo_database.name
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


