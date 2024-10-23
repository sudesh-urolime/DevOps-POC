# Root variables.tf
variable "resource_group_name" {
  description = "The name of the resource group for all resources."
  type        = string
}

variable "location" {
  description = "The location for all resources."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
}

variable "public_subnet_prefix" {
  description = "The address prefix for the public subnet."
  type        = string
}

variable "private_subnet_prefix" {
  description = "The address prefix for the private subnet."
  type        = string
}

variable "secret_name" {
  description = "The name of the Key Vault secret."
  type        = string
}

variable "cosmos_secret_name" {
  description = "The name of the Key Vault secret."
  type        = string
}

variable "network_interface_name" {
  description = "Network interface name"
  type        = string

}

variable "cosmosdb_account_name" {
  description = "Name of the Cosmos DB account."
}

variable "mongo_database_name" {
  description = "Name of the MongoDB database in Cosmos DB."
}

variable "mongo_collection_name" {
  description = "Name of the MongoDB collection in Cosmos DB."
}

variable "aks_name" {
  description = "The name of the Azure Kubernetes Service (AKS) cluster."
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster."
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster's default node pool."
  type        = number
}

variable "tenant_id" {
  description = "The tenant ID for the Azure subscription."
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine for the AKS cluster nodes."
  type        = string
}

variable "jump_host_password" {
  description = "The password for the jump host (stored in Key Vault)."
  type        = string
  sensitive   = true
}

variable "key_vault_name" {
  description = "The name of the Key Vault to be created."
  type        = string
}

variable "acr_name" {
  description = "The name of the Azure Container Registry."
  type        = string
}

variable "subscription_id" {
  description = "Subscription iD of Azure"
  type = string
  
}

variable "client_id" {
  description = "Client iD of Azure"
  type = string
  
}

variable "uniqueKey" {
  description = "Unique key for cosmosdb collection"
  type = string
}


variable "client_secret" {
  description = "Client secret of Azure"
  type = string
}