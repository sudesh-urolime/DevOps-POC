resource_group_name = "Dr_azure_poc"
location            = "centralindia"

#========================Vnet and Subnets==============================
vnet_name                 = "prod_vnet_poc"
network_address_space     = ["10.2.0.0/16"]
aks_subnet_address_prefix = "10.2.1.0/24"
aks_subnet_address_name   = "aks-subnet"
# acr_subnet_address_prefix     = "172.1.0.0/18"
# acr_subnet_address_name       = "acr-subnet"
storage_subnet_address_name   = "storage-subnet"
storage_subnet_address_prefix = "10.2.3.0/24"


######################bastion#################################################

vm_name               = "bastion-server"
networkinterface_name = "prod_nic"
pubip_name            = "prod_publicIP"
allocation_method     = "Dynamic"
#ip_name                      ="internal"  
# storage_mb                  = 51200
 vm_size = "Standard_DC1ds_v3"
 


###################ACR#################################

  acr_name = "furnitureacr"
  
#######################################################