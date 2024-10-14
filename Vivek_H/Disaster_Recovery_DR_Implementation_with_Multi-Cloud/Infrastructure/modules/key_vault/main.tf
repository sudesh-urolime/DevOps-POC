# Creates a Key Vault to store secrets like jump host password
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "main" {
  name                       = var.key_vault_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = var.soft_delete_retention_days

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = var.key_permissions

    secret_permissions = var.secret_permissions
  }
}

resource "azurerm_key_vault_secret" "main" {
  name         = var.secret_name
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.main.id
}