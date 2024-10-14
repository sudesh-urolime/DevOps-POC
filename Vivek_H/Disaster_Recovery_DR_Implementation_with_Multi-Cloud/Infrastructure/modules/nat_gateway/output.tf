# modules/nat_gateway/outputs.tf

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway."
  value       = azurerm_nat_gateway.main.id
}
