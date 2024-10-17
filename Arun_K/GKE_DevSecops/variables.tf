# variables.tf

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "vpc_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "value"
  type = list(string)
}

variable "subnet_public_name" {
  description = "value"
  type = string
  default = "subnet-1"
}

variable "cidr_ranges" {
  description = "List of CIDR ranges for the subnets"
  type        = list(string)
}

variable "router_name" {
  description = "The name of the Cloud Router"
  type        = string
}

variable "nat_name" {
  description = "The name of the NAT configuration"
  type        = string
}

# Logging configuration for NAT
variable "nat_logging_enabled" {
  description = "Enable logging for NAT"
  type        = bool
  default     = true
}

variable "nat_log_filter" {
  description = "The log filter for NAT (options: ALL, ERRORS_ONLY, TRANSLATIONS_ONLY)"
  type        = string
  default     = "ALL"
}

variable "vm_name" {
  description = "The name of the virtual machine instance"
  type        = string
}

variable "machine_type" {
  description = "The machine type for the VM instance"
  type        = string
}

variable "zone" {
  description = "The GCP zone where the VM will be created"
  type        = string
}

variable "vm_image" {
  description = "The image to use for the boot disk of the VM"
  type        = string
}

variable "service_account_email" {
  description = "The service account email to attach to the VM"
  type        = string
}
variable "repository_id" {
  type        = string
  description = "The repository name"
}

variable "location" {
  type        = string
  description = "The name of the location this repository is located in"
}

variable "format" {
  type        = string
  description = "The format of packages that are stored in the repository. You can only create alpha formats if you are a member of the alpha user group."
}

variable "description" {
  type        = string
  description = "The user-provided description of the repository"
  default     = null
}

# Cluster variables
variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string
}

# variable "subnet_name" {
#   description = "The name of the subnetwork"
#   type        = string
# }

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
