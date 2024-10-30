output "private_nsg_id" {
  description = "The ID of the Network Security Group"
  value       = azurerm_network_security_group.private_nsg.id
}

output "public_nsg_id" {
  description = "The ID of the Network Security Group"
  value       = azurerm_network_security_group.public_nsg.id
}