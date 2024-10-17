resource "azurerm_storage_account" "statefile_storage" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = "LRS"

  tags = {
    environment = "production"
  }
}

resource "azurerm_storage_container" "example" {
  name                  = var.name
  storage_account_name  = azurerm_storage_account.statefile_storage.name
  container_access_type = var.container_access_type
}
