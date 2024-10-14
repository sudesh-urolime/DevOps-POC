# modules/vnet/outputs.tf

output "private_subnet_id" {
  description = "The ID of the private subnet."
  value       = azurerm_subnet.private.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet."
  value       = azurerm_subnet.public.id
}
