# output "nsg_rule_id" {
#   value       = azurerm_network_security_rule.nsg_rule.id
#   description = "The ID of the network security rule."
# }
output "nsg_rules_ids" {
  value = [for r in azurerm_network_security_rule.rule : r.id]
  description = "List of NSG rule IDs."
}