variable "environment" {
  type =  string
  description = "environment which this service is deployed"
}
variable "name" {
  type        = string
  description = "The name of the network security group."
}

variable "location" {
  type        = string
  description = "The location to deploy the NSG."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

