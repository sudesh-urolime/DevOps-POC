# Output for Virtual Network
output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.poc_vnet.id
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.poc_vnet.name
}

output "vnet_address_space" {
  description = "The address space of the virtual network"
  value       = azurerm_virtual_network.poc_vnet.address_space
}

# Output for Subnets
output "public_subnet_id" {
  value = element([for s in azurerm_subnet.subnet : s.id if s.name == "${var.environment}-public-subnet"], 0)
  description = "The ID of the public subnet"
}
output "private_subnet_id" {
  value = element([for s in azurerm_subnet.subnet : s.id if s.name == "${var.environment}-private-subnet"], 0)
  description = "The ID of the public subnet"
}

output "subnet_names" {
  description = "The names of the created subnets"
  value       = [for s in azurerm_subnet.subnet : s.name]
}

# Output for Public IP
output "public_ip_address" {
  description = "The allocated public IP address for NAT Gateway"
  value       = azurerm_public_ip.vnet_nat_gw_ip.ip_address
}

output "public_ip_id" {
  description = "The ID of the public IP for NAT Gateway"
  value       = azurerm_public_ip.vnet_nat_gw_ip.id
}

# Output for NAT Gateway
output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = azurerm_nat_gateway.vnet_nat_gw.id
}

# Output for NAT Gateway - Public IP Association
output "nat_gateway_public_ip_association_id" {
  description = "The ID of the NAT Gateway Public IP Association"
  value       = azurerm_nat_gateway_public_ip_association.vnet_nat_gw_ip_association.id
}

output "private_subnet_nsg_association_ids" {
  value = {
    for key, assoc in azurerm_subnet_network_security_group_association.nsg_assosiation_private_subnet : key => assoc.id
  }
  description = "The IDs of the NSG associations for private subnets"
}