variable "cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "default_node_pool_name" {
  description = "The name of the default node pool."
  type        = string
}

variable "default_node_pool_vm_size" {
  description = "The size of the Virtual Machine for the default node pool."
  type        = string
}

variable "default_node_pool_zones" {
  description = "The availability zones for the default node pool."
  type        = list(number)
}

variable "enable_auto_scaling" {
  description = "Enable auto-scaling for the default node pool."
  type        = bool
}

variable "max_count" {
  description = "Maximum number of nodes for the default node pool when auto-scaling is enabled."
  type        = number
}

variable "min_count" {
  description = "Minimum number of nodes for the default node pool when auto-scaling is enabled."
  type        = number
}

variable "os_disk_size_gb" {
  description = "The size of the OS disk in GB for the default node pool."
  type        = number
}

variable "node_pool_type" {
  description = "The type of the node pool (e.g., 'VirtualMachineScaleSets')."
  type        = string
}

variable "node_labels" {
  description = "Labels for the default node pool."
  type        = map(string)
}

variable "node_pool_tags" {
  description = "Tags for the default node pool."
  type        = map(string)
}

variable "network_plugin" {
  description = "The network plugin for the AKS cluster (e.g., 'azure')."
  type        = string
}

variable "load_balancer_sku" {
  description = "The SKU for the load balancer (e.g., 'standard')."
  type        = string
}

variable "admin_username" {
  description = "The admin username for the Linux profile."
  type        = string
}

variable "nodepool-type" {
  description = "The type of the node pool, e.g., 'system'."
  type        = string
}

variable "environment" {
  description = "The environment type, e.g., 'prod'."
  type        = string
}

variable "nodepoolos" {
  description = "The operating system of the node pool, e.g., 'linux'."
  type        = string
}
variable "aks_subnet_id" {
    type = string
 
}

variable "resource_group_name" {
  description = "The name of the resource group in which the VNet is created."
  type        = string
}

variable "location" {
  description = "The location/region where the Virtual Network is created."
  type        = string
}