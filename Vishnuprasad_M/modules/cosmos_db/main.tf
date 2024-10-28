resource "azurerm_cosmosdb_account" "cosmos-db-account" {
  name                = "${var.environment}-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = var.offer_type
  kind                = var.kind
  automatic_failover_enabled = var.automatic_failover_enabled
  public_network_access_enabled  = false
  geo_location {
    location          = var.location
    failover_priority = 0
  }
  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }
  tags = {
    environment = var.environment
  }
}  
resource "azurerm_private_endpoint" "cosmosdb_private_endpoint" {
  name                = "${var.environment}-${var.cosmosdb_private_endpoint}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_subnet_id

  private_service_connection {
    name                           = "${var.environment}-${var.cosmosdb_private_service_connection_name}"
    private_connection_resource_id = azurerm_cosmosdb_account.cosmos-db-account.id
    is_manual_connection           = false 
    subresource_names              = ["Sql"]
  }
}

