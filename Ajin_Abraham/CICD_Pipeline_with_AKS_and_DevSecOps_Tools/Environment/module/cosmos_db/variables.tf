variable "cosmosdb_name" {
  type = string
  description = "cosmosdb account name"
  default = ""
}
variable "location" {
  type = string
  description = "location of cosmosdb"
  default = ""
}
variable "resource_group_name" {
  type = string
  description = "resource group name"
  default = ""
}
variable "offer_type" {
  type = string
  description = "offer type for cosmosdb"
  default = ""
}
variable "kind" {
  type = string
  description = "kind of cosmosdb"
  default = ""
}
variable "automatic_failover_enabled" {
  type = string
  description = "automatic failover details"
  default = ""
}
variable "consistency_level" {
  type = string
  description = "consistency level for cosmosdb"
  default = ""
}
#################################
variable "storage_subnet_id" {
  type = string
}
variable "vnet_id" {
  type = string
}