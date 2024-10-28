variable "name" {
    type = string
    description = "name for acr"
    default = "" 
}
variable "location" {
    type = string
    description = "location for acr"
    default = ""  
}
variable "resource_group_name" {
    type = string
    description = "name of resource group"
    default = "" 
}
variable "sku" {
    type = string
    description = "sku used for acr"
    default = "" 
}
variable "admin_enabled" {
    type = string
    description = "admin enabled for acr"
    default = "" 
}
variable "environment" {
    type =  string
    description = "environment which this service is deployed"
}