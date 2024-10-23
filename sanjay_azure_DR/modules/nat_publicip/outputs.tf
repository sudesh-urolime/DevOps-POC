# modules/public_ip/outputs.tf

output "public_ip_address" {
  description = "The IP address of the Public IP."
  value       = azurerm_public_ip.main.ip_address
}

output "public_ip_id" {
  value = azurerm_public_ip.main.id
}