output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "aks_subnet_id" {
  value = azurerm_subnet.aks.id
}

output "acr_subnet_id" {
  value = azurerm_subnet.acr.id
}
output "storage_subnet_id" {
  value = azurerm_subnet.storage.id
}