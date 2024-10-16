output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "aks_subnet_id" {
  value = module.vnet.aks_subnet_id # Adjust this according to your subnet resource name
}


