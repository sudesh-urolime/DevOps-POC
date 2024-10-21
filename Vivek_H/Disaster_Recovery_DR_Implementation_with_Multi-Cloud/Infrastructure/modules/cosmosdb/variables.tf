variable "resource_group_name" {
  description = "The name of the resource group where the VNet will be created."
  type        = string
}

variable "location" {
  description = "The location of the virtual network."
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

variable "private_subnet_id" {
  description = "The ID of the private subnet for the AKS cluster."
  type        = string
}

variable "uniqueKey" {
  description = "Unique key value"
  type = string
}