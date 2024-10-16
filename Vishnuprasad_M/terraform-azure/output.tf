# output "public_nsg_id" {
#   value       = module.network_security_group["nsg1"].nsg_id["nsg1"]
#   description = "The ID of the public NSG (nsg1)"
# }

# output "private_nsg_id" {
#   value       = module.network_security_group["nsg2"].nsg_id["nsg2"]
#   description = "The ID of the private NSG (nsg2)"
# }
# output "public_nsg_id" {
#   value       = module.network_security_group.nsg_ids[nsg1]
#   description = "The ID of the public network security group (nsg1)"
# }

# output "private_nsg_id" {
#   value       = module.network_security_group.nsg_ids[nsg2]
#   description = "The ID of the private network security group (nsg2)"
# }

# output "public_nsg_id" {
#   value       = module.network_security_group.nsg_id["nsg1"]
#   description = "The ID of the public network security group (nsg1)"
# }

# output "private_nsg_id" {
#   value       = module.network_security_group.nsg_id["nsg2"]
#   description = "The ID of the private network security group (nsg2)"
# }
# output "public_nsg_id" {
#   value       = module.network_security_group["nsg1"].nsg_id
#   description = "The ID of the public network security group"
# }

# output "private_nsg_id" {
#   value       = module.network_security_group["nsg2"].nsg_id
#   description = "The ID of the private network security group"
# }
output "module_bastion_public_key" {
  value = module.bastion.public_key
  sensitive = true
}

output "module_bastion_private_key" {
  value = module.bastion.private_key
  sensitive = true
}

output "module_bastion_private_key_path" {
  value = module.bastion.private_key_path
  sensitive = true
}

output "module_bastion_public_key_path" {
  value = module.bastion.public_key_path
}