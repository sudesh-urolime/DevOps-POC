# modules/aks/variables.tf
variable "aks_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "location" {
  description = "The location where the AKS cluster will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the AKS cluster will be created."
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster."
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the private subnet for the AKS cluster."
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the default node pool."
  type        = number
}

variable "vm_size" {
  description = "The size of the virtual machine for the nodes."
  type        = string
}

variable "service_cidr" {
  description = "The CIDR for the AKS service network"
  default     = "10.2.0.0/24"
}

variable "dns_service_ip" {
  description = "The DNS IP for the AKS cluster"
  default     = "10.2.0.10"
}