variable "environment" {
    type =  string
    description = "environment which this service is deployed"
}
variable "name" {
  description = "name for the aks cluster"
  type = string
  default = ""
}
variable "location" {
    description = "location for the cluster to create"
    type = string
    default = ""
}
variable "resource_group_name" {
    description = "name of the resource group were aks is deployed"
    type = string
    default = ""
}
variable "kubernetes_version" {
  description = "kubernetes verion used"
  type = string
  default = ""
}
variable "dns_prefix" {
  description = "dns prefix for the cluster"
  type = string
  default = ""
}
variable "default_node_pool_name" {
  description = "default node pool name"
  type = string
  default = ""
}
variable "default_node_pool_vm_size" {
  description = "default node pool vm size of the cluster"
  type = string
  default = ""
}
variable "zones" {
  description = "default node pool zone"
  type = list(number)
}
variable "enable_auto_scaling" {
    type = string
    description = "enable auto scaling of the nodes"
    default = ""
}
variable "max_count" {
  type = string
  description = "maximum node count"
  default = ""
}
variable "min_count" {
  type = string
  description = "minimum count of nodes"
  default = ""
}
variable "os_disk_size_gb" {
  description = "os disk size needed"
  type = string
  default = ""
}
variable "aks_subnet_id" {
  description = "subnet id for the cluster"
  type = string
  default = ""
}
variable "node_pool_type" {
  description = "node pool type used"
  type = string
  default = ""
}
variable "node_pool_os" {
  description = "value"
  type = string
  default = ""
}
variable "network_plugin" {
  description = "network plugin used"
  type = string
  default = ""
}
variable "load_balancer_sku" {
  description = "loadbalancer sku"
  type = string
  default = ""
}