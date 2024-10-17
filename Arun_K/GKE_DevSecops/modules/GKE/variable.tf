# Cluster variables
variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnetwork"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for master authorized networks"
  type        = string
}

variable "cidr_display_name" {
  description = "Display name for the CIDR block"
  type        = string
}

variable "master_ipv4_cidr_block" {
  description = "CIDR block for the Kubernetes control plane"
  type        = string
}

variable "services_secondary_range_name" {
  description = "The secondary range name for services"
  type        = string
}

variable "cluster_secondary_range_name" {
  description = "The secondary range name for the cluster"
  type        = string
}

variable "logging_service" {
  description = "Logging service (e.g., logging.googleapis.com/kubernetes)"
  type        = string
  default     = "logging.googleapis.com/kubernetes"
}

variable "monitoring_service" {
  description = "Monitoring service (e.g., monitoring.googleapis.com/kubernetes)"
  type        = string
  default     = "monitoring.googleapis.com/kubernetes"
}

# Node pool variables
variable "nodepool_name" {
  description = "The name of the node pool"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the pool"
  type        = number
  default     = 1
}

variable "preemptible" {
  description = "Whether the nodes are preemptible"
  type        = bool
  default     = true
}

variable "node_machine_type" {
  description = "The machine type for the worker nodes"
  type        = string
}

variable "node_disk_type" {
  description = "The disk type for the worker nodes (e.g., pd-standard)"
  type        = string
}

variable "node_disk_size_gb" {
  description = "The disk size in GB for the worker nodes"
  type        = number
}

variable "node_image_type" {
  description = "The image type for the worker nodes (e.g., COS, Ubuntu)"
  type        = string
}

variable "node_service_account_name" {
  description = "The service account name for the GKE node pool"
  type        = string
}

variable "node_sa_roles" {
  description = "A list of IAM roles to assign to the node service account"
  type        = list(string)
}

# Project variables
variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

