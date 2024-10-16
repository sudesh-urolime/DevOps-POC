output "vnet_security_group_name" {
  description = "The name of the created network security group."
  value       = azurerm_network_security_group.vnet_security_group.name
}
output "nsg_id" {
  description = "The ID of the Network Security Group"
  value       = azurerm_network_security_group.vnet_security_group.id
}

# output "nsg_ids" {
#   value = {
#     for key, nsg in azurerm_network_security_group.vnet_security_group : key => nsg.id
#   }
#   description = "Map of NSG IDs with keys such as nsg1 (public) and nsg2 (private)"
# }
# output "vnet_security_group_names" {
#   value = {
#     for key, nsg in azurerm_network_security_group.vnet_security_group : key => nsg.name
#   }
#   description = "Map of NSG names for each NSG created"
# }

# output "nsg_ids" {
#   value = {
#     for key, nsg in azurerm_network_security_group.vnet_security_group : key => nsg.id
#   }
#   description = "Map of NSG IDs for each NSG created"
# }

# output "nsg_ids" {
#   value = {
#     for key, nsg in azurerm_network_security_group.vnet_security_group : key => nsg.id
#   }
#   description = "Map of NSG IDs with keys like nsg1 and nsg2"
# }

# output "private_nsg_id" {
#   value = azurerm_network_security_group.vnet_security_group.id
#   description = "ID of the private network security group"
# }

# output "public_nsg_id" {
#   value = azurerm_network_security_group.vnet_security_group.id
#   description = "ID of the public network security group"
# }


