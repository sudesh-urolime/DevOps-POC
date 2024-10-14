# Creates a resource group in Azure
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# Output the resource group name and location
output "name" {
  value = azurerm_resource_group.main.name
}

output "location" {
  value = azurerm_resource_group.main.location
}
