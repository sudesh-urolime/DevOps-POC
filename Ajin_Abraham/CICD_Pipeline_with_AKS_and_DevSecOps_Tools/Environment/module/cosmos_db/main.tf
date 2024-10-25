resource "azurerm_cosmosdb_account" "cosmos-db-account" {
  name                = var.cosmosdb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = var.offer_type
  kind                = var.kind
  automatic_failover_enabled = var.automatic_failover_enabled
  public_network_access_enabled = false
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

#####################################################################
data "azurerm_private_dns_zone" "dbstorage" {
  name                = "privatelink.documents.azure.com"
  resource_group_name = var.resource_group_name
}

output "private_dns_zone_id" {
  value = data.azurerm_private_dns_zone.dbstorage
}


# resource "azurerm_private_dns_zone" "dbstorage" {
#   name                = "privatelink.documents.azure.com"
#   resource_group_name = var.resource_group_name #azurerm_resource_group.example.name
# }

resource "azurerm_private_endpoint" "dbstorage" {
  name                = "dbstorage-private-endpoint"
  location            = var.location            #azurerm_resource_group.example.location
  resource_group_name = var.resource_group_name #azurerm_resource_group.example.name
  subnet_id           = var.storage_subnet_id

  private_service_connection {
    name                           = "dbstorage-privateserviceconnection"
    private_connection_resource_id = azurerm_cosmosdb_account.cosmos-db-account.id
    subresource_names              = ["sql"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dbstorage-dns-zone-group"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dbstorage.id]
  }
}

#resource "azurerm_private_dns_zone" "storage" {
# name                = "privatelink.blob.core.windows.net"
# resource_group_name = var.resource_group_name #azurerm_resource_group.example.name
#}

resource "azurerm_private_dns_zone_virtual_network_link" "storage" {
  name                  = "dbstorage-dns-zone-link"
  resource_group_name   = var.resource_group_name #azurerm_resource_group.example.name
  private_dns_zone_name = data.azurerm_private_dns_zone.dbstorage.name
  virtual_network_id    = var.vnet_id
}

# resource "azurerm_private_dns_a_record" "storage" {
#   name                = azurerm_cosmosdb_account.cosmos-db-account.name
#   zone_name           = data.azurerm_private_dns_zone.dbstorage.name
#   resource_group_name = var.resource_group_name #azurerm_resource_group.example.name
#   ttl                 = 300
#   records             = [azurerm_private_endpoint.dbstorage.private_service_connection[0].private_ip_address]
#     lifecycle {
#       create_before_destroy = true
#      ignore_changes = [records]  # Specify attributes to ignore
#    }
# }
