resource "azurerm_virtual_network" "poc_vnet" {
  name                = "${var.environment}-${var.vnet_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_cidr]

  tags = {
    environment = var.environment
  }
}

# Create subnets using a loop for flexibility
resource "azurerm_subnet" "subnet" {
  count                = length(var.subnets)
  name                 = "${var.environment}-${var.subnets[count.index].name}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.poc_vnet.name
  address_prefixes     = var.subnets[count.index].address_prefixes

  private_endpoint_network_policies = var.subnets[count.index].private_endpoint_status != "null" ? var.subnets[count.index].private_endpoint_status : null
  depends_on = [ azurerm_virtual_network.poc_vnet ]
}

# Create public IP
resource "azurerm_public_ip" "vnet_nat_gw_ip" {
  name                = "${var.environment}-${var.vnet_nat_gw_ip_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = [1]
  tags = {
    environment = var.environment
  }
}

# NAT Gateway
resource "azurerm_nat_gateway" "vnet_nat_gw" {
  name                    = "${var.environment}-${var.vnet_nat_gw_name}"
  location                = var.location
  resource_group_name     = var.resource_group_name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
  zones                   = [1]
  tags = {
    environment = var.environment
  }
}

# NAT Gateway - Public IP Association
resource "azurerm_nat_gateway_public_ip_association" "vnet_nat_gw_ip_association" {
  nat_gateway_id       = azurerm_nat_gateway.vnet_nat_gw.id
  public_ip_address_id = azurerm_public_ip.vnet_nat_gw_ip.id
  depends_on = [ azurerm_public_ip.vnet_nat_gw_ip ]
}

# NAT - Subnets association for each subnet that has NAT enabled
resource "azurerm_subnet_nat_gateway_association" "subnet_nat_gw_assoc" {
  for_each = {
    for s in azurerm_subnet.subnet : s.name => s
    if s.name == "${var.environment}-private-subnet"
  }
  subnet_id      = each.value.id
  nat_gateway_id = azurerm_nat_gateway.vnet_nat_gw.id
  depends_on     = [ azurerm_virtual_network.poc_vnet, azurerm_subnet.subnet ]
}

resource "azurerm_subnet_network_security_group_association" "nsg_assosiation_private_subnet" {
  for_each = {
    for s in azurerm_subnet.subnet : s.name => s
    if s.name == "${var.environment}-private-subnet"
  }
  subnet_id                 = each.value.id
  network_security_group_id = var.network_security_group_id_private
}
resource "azurerm_subnet_network_security_group_association" "nsg_assosiation_public_subnet" {
  for_each = {
    for s in azurerm_subnet.subnet : s.name => s
    if s.name == "${var.environment}-public-subnet"
  }
  subnet_id                 = each.value.id
  network_security_group_id = var.network_security_group_id_public
}
