#--------------------------------------------------------------------------
# ACR Creation
#-------------------------------------------------------------------------- 
resource "azurerm_container_registry" "this" {
  name                          = var.registry_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  sku                           = var.sku
  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled
   
     lifecycle {
    # Prevent accidental destroy of Container Registry.
    prevent_destroy = false

    # precondition {
    #   condition     = var.sku == "Premium" ? length(var.georeplications) >= 0 : length(var.georeplications) == 0
    #   error_message = "Geo-replications can only be configured if SKU is \"Premium\"."
    # }
  }
}

