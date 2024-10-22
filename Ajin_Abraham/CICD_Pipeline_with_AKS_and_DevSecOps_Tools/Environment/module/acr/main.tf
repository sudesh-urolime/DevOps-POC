#locals {
  # Store gepreplications in map where key is location.
  # This automatically sorts the map by location.
  # georeplications = {
  #  for georeplication in var.georeplications : georeplication.location => georeplication
  #}

  #diagnostic_setting_metric_categories = ["AllMetrics"]
#}

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
   
 # dynamic "georeplications" {
 #   for_each = local.georeplications

 #   content {
 #    location                = georeplications.value["location"]
 #     zone_redundancy_enabled = georeplications.value["zone_redundancy_enabled"]
 #   }
 # }

    lifecycle {
    # Prevent accidental destroy of Container Registry.
    prevent_destroy = false

 #   precondition {
 #     condition     = var.sku == "Premium" ? length(var.georeplications) >= 0 : length(var.georeplications) == 0
 #     error_message = "Geo-replications can only be configured if SKU is \"Premium\"."
 #   }
 # }
#}

