resource "azurerm_mysql_flexible_server" "mysql_server" {
  name                = var.mysql_server_name
  resource_group_name = var.resource_group_name
  location            = var.location
  administrator_login = var.admin_username
  administrator_password = var.admin_password
  sku_name            = var.sku_name # Example: "Standard_B1ms"
  version             = var.mysql_version # Example: "8.0"
  
  #storage_mb          = var.storage_mb
  backup_retention_days = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled

  delegated_subnet_id = var.storage_subnet_id

  tags = {
    Environment = var.environment
  }
}

