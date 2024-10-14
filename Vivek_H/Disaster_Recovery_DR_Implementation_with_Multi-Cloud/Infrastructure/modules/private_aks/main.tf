# Creates an AKS cluster in the private subnet
resource "azurerm_kubernetes_cluster" "aks" {
  name                    = var.aks_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  dns_prefix              = var.dns_prefix
  node_resource_group     = "${var.resource_group_name}-nodes"
  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
    vnet_subnet_id = var.private_subnet_id
  }

  network_profile {
    network_plugin    = "azure"
    service_cidr      = var.service_cidr
    dns_service_ip    = var.dns_service_ip
    load_balancer_sku = "standard"
  }

  identity {
    type = "SystemAssigned"
  }
}
