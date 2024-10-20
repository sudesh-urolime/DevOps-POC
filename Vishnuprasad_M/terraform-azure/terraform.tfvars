rg-name  = "poc-azure-aws-dr-rg"
location = "centralindia" #"eastus"
#####################
# nsg_settings = {
#   "nsg1" = {
#     vnet_security_group_name = "public_vnet_security_group_poc"
#     location                 = "East US"
#     resource_group_name      = "poc-azure-aws-dr-rg"
#   },
#   "nsg2" = {
#     vnet_security_group_name = "private_vnet_security_group_poc"
#     location                 = "East US"
#     resource_group_name      = "poc-azure-aws-dr-rg"
#   }
# }


# nsg_rules = {
#   # Rules for the public NSG (nsg1)
#   "nsg1" = {
#     rules = {
#       "rule1" = {
#         name                       = "allow_https_outbound"
#         priority                   = 100
#         direction                  = "Outbound"
#         access                     = "Allow"
#         protocol                   = "Tcp"
#         source_port_range          = "*"
#         destination_port_range     = "443"
#         source_address_prefix      = "*"
#         destination_address_prefix = "*"
#       }
#       "rule2" = {
#         name                       = "allow_ssh_inbound"
#         priority                   = 101
#         direction                  = "Inbound"
#         access                     = "Allow"
#         protocol                   = "Tcp"
#         source_port_range          = "*"
#         destination_port_range     = "22"
#         source_address_prefix      = "*"
#         destination_address_prefix = "*"
#       }
#     }
#   }

#   # Rules for the private NSG (nsg2)
#   "nsg2" = {
#     rules = {
#       "rule1" = {
#         name                       = "allow_https_outbound"
#         priority                   = 100
#         direction                  = "Outbound"
#         access                     = "Allow"
#         protocol                   = "Tcp"
#         source_port_range          = "*"
#         destination_port_range     = "443"
#         source_address_prefix      = "*"
#         destination_address_prefix = "*"
#       }
#       "rule2" = {
#         name                       = "allow_ssh_inbound"
#         priority                   = 101
#         direction                  = "Inbound"
#         access                     = "Allow"
#         protocol                   = "Tcp"
#         source_port_range          = "*"
#         destination_port_range     = "22"
#         source_address_prefix      = "*"
#         destination_address_prefix = "*"
#       }
#     }
#   }
# }



# nsg_rules = {
#   "nsg1" = {
#     rules = {
#       "rule1" = {
#         vent_sg_rule_name                       = "allow_https_outbound"
#         vent_sg_rule_priority                   = 100
#         vent_sg_rule_direction                  = "Outbound"
#         vent_sg_rule_access                     = "Allow"
#         vent_sg_rule_protocol                   = "Tcp"
#         vent_sg_rule_source_port_range          = "*"
#         vent_sg_rule_destination_port_range     = "443"
#         vent_sg_rule_source_address_prefix      = "*"
#         vent_sg_rule_destination_address_prefix = "*"
#       }
#       "rule2" = {
#        name                       = "allow_ssh_inbound"
#        priority                   = 101
#        direction                  = "Inbound"
#        access                     = "Allow"
#        protocol                   = "Tcp"
#        source_port_range          = "*"
#        destination_port_range     = "22"
#        source_address_prefix      = "*"
#        destination_address_prefix = "*"
#       }
#     }
#   }
#   "nsg1" = {
#     rules = {
#       "rule1" = {
#         vent_sg_rule_name                       = "allow_https_outbound"
#         vent_sg_rule_priority                   = 100
#         vent_sg_rule_direction                  = "Outbound"
#         vent_sg_rule_access                     = "Allow"
#         vent_sg_rule_protocol                   = "Tcp"
#         vent_sg_rule_source_port_range          = "*"
#         vent_sg_rule_destination_port_range     = "443"
#         vent_sg_rule_source_address_prefix      = "*"
#         vent_sg_rule_destination_address_prefix = "*"
#       }
#       "rule2" = {
#        name                       = "allow_ssh_inbound"
#        priority                   = 101
#        direction                  = "Inbound"
#        access                     = "Allow"
#        protocol                   = "Tcp"
#        source_port_range          = "*"
#        destination_port_range     = "22"
#        source_address_prefix      = "*"
#        destination_address_prefix = "*"
#       }
#     }
#   }
# }



###
# vnet_security_group_name       = "vnet_security_group_poc"
# nsg_rules   = {
#   rule1 = {
#     name                       = "allow_https_outbound"
#     priority                   = 100
#     direction                  = "Outbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "443"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
#   rule2 = {
#     name                       = "allow_ssh_inbound"
#     priority                   = 101
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "22"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# }
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
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  "rule2" = {
    name                       = "allow_ssh"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

private_nsg_rules = {
  "rule1" = {
    name                       = "allow_all_outbound"
    priority                   = 120
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  "rule2" = {
    name                       = "allow_alltraffic"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
# ######################

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
# bastion_network_interface_name        = "bastion_network_interface"
# bastion_ip_config_name                = "bastion_ip_config"
# bastion_name                          = "bastion"
# bastion_size                          = "Standard_DC1ds_v3" #Standard_B2ps_v2"
# bastion_user_name                     = "vishnu"
# os_disk_caching                       = "ReadWrite"
# os_disk_name                          = "os_disk_bastion"
# os_disk_storage_account_type          = "Standard_LRS"
# pvt_ip_allocation_net_int             = "Dynamic"
# disable_password_authentication       = "true"
# source_image_reference_offer          = "UbuntuServer"
# source_image_reference_publisher      = "Canonical"
# source_image_reference_sku            = "18_04-lts-gen2"
# source_image_reference_version        = "18.04.202205270"
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