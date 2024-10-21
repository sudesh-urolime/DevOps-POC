output "nsg_rules_ids" {
  value = [for r in azurerm_network_security_rule.rule : r.id]
  description = "List of NSG rule IDs."
}