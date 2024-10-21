
output "nsg_id" {
  value       = azurerm_network_security_group.nsg.id
  description = "The ID of the network security group."
}

output "nsg_name" {
  value       = azurerm_network_security_group.nsg.name
  description = "The name of the network security group."
}