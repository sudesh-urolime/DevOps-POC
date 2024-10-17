# resource "azurerm_network_security_rule" "vent_sg_rule" {
#   name                        = var.vent_sg_rule_name
#   priority                    = var.vent_sg_rule_priority
#   direction                   = var.vent_sg_rule_direction
#   access                      = var.vent_sg_rule_access
#   protocol                    = var.vent_sg_rule_protocol
#   source_port_range           = var.vent_sg_rule_source_port_range
#   destination_port_range      = var.vent_sg_rule_destination_port_range
#   source_address_prefix       = var.vent_sg_rule_source_address_prefix
#   destination_address_prefix  = var.vent_sg_rule_destination_address_prefix
#   resource_group_name         = var.resource_group_name
#   network_security_group_name = var.vnet_security_group_name
# }
resource "azurerm_network_security_rule" "rule" {
  for_each = var.nsg_rules

  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.network_security_group_name
}