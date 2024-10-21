rg-name  = "poc-azure-aws-dr-rg"
location = "centralindia" #"eastus"
##########NSG###########
public_nsg_name  = "public-nsg"
private_nsg_name = "private-nsg"

public_nsg_rules = {
  "rule1" = {
    name                       = "allow_https"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "192.168.0.0/16"
    description = "POC-AZURE"
    destination_address_prefix = "*"
  },
  "rule1" = {
    name                       = "allow_ssh"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "103.141.54.90"
    destination_address_prefix = "4.247.151.86"
    description = "POC-AZURE"
  }
}

private_nsg_rules = {

  "rule1" = {
    name                       = "allow_alltraffic"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "192.168.0.0/16"
    destination_address_prefix = "*"
    description = "POC-AZURE"
  }
}

###########VNET############
vnet_name           = "vnet_poc"
vnet_cidr           = "192.168.0.0/16"
vnet_nat_gw_ip_name = "poc_vnet_ip"
vnet_nat_gw_name    = "poc_vnet_gw"

subnets = [
  {
    name                    = "public-subnet"
    address_prefixes        = ["192.168.0.0/17"]
    private_endpoint_status = "Disabled"
    nat_gateway_enabled     = false
  },
  {
    name                    = "private-subnet"
    address_prefixes        = ["192.168.128.0/17"]
    private_endpoint_status = "Enabled"
    nat_gateway_enabled     = true
  }
]
######BASTION######
bastion_network_interface_name   = "bastion_network_interface"
bastion_ip_config_name           = "bastion_ip_config"
bastion_name                     = "bastion"
bastion_size                     = "Standard_B2s"
bastion_user_name                = "vishnu"
os_disk_caching                  = "ReadWrite"
os_disk_name                     = "os_disk_bastion"
os_disk_storage_account_type     = "Standard_LRS"
pvt_ip_allocation_net_int        = "Dynamic"
disable_password_authentication  = "true"
source_image_reference_offer     = "0001-com-ubuntu-server-jammy"
source_image_reference_publisher = "Canonical"
source_image_reference_sku       = "22_04-lts"
source_image_reference_version   = "latest"

###############AKS############
aks_name                  = "private-aks-cluster"
dns_prefix                = "private-aks-cluster-poc"
kubernetes_version        = "1.29.8"
default_node_pool_name    = "default"
default_node_pool_vm_size = "Standard_DS2_v2" #"Standard_D2pls_v5" #"Standard_B2s"
node_pool_zones           = [1, 2, 3]
enable_auto_scaling       = "true"
max_node_count            = "2"
min_node_count            = "1"
os_disk_size_gb           = "30"
node_pool_type            = "VirtualMachineScaleSets"
node_pool_os              = "linux"
network_plugin            = "azure"
load_balancer_sku         = "standard"

#######ACR#######
acr_name          = "AcrDrPoc"
acr_sku           = "Basic"
acr_admin_enabled = "true"

##########COSMOSDB#########
cosmosdb_name                       = "poc-db-azure1121"
cosmosdb_offer_type                 = "Standard"
cosmosdb_kind                       = "GlobalDocumentDB"
cosmosdb_automatic_failover_enabled = "false"
cosmosdb_consistency_level          = "BoundedStaleness"