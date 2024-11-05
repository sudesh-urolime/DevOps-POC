variable "project" {
  type        = string
  description = "Google Cloud Project Name"
}

variable "region" {
  type        = string
  description = "Default Google Cloud Region"
}

variable "vpc" {
  type        = string
  description = "Development Environment VPC Network"
}

variable "gke_subnet_name" {
  type        = string
  description = "GKE Subnet Name"
}

variable "gke_subnet_region" {
  type        = string
  description = "GKE Subnet Region"
}

variable "gke_subnet_cidr" {
  type        = string
  description = "GKE Subnet CIDR"
}

variable "gke_subnet_cluster_cidr" {
  type        = string
  description = "GKE Subnet Cluster CIDR"
}

variable "gke_subnet_services_cidr" {
  type        = string
  description = "GKE Subnet Services CIDR"
}

variable "cluster_name" {
  type        = string
  description = "GKE cluster name"
}

variable "cluster_location" {
  type        = string
  description = "GKE cluster Region/Zone"
}

variable "standard_machine_type" {
  type        = string
  description = "Machine type to use for the general-purpose node pool. See https://cloud.google.com/compute/docs/machine-types"
}

variable "standard_min_node_count" {
  type        = string
  description = "The minimum number of nodes PER ZONE in the general-purpose node pool"
  default     = 1
}

variable "standard_max_node_count" {
  type        = string
  description = "The maximum number of nodes PER ZONE in the general-purpose node pool"
  default     = 5
}

# variable "secondary_ip_range" {
#   type = list(string)
# }

variable "ports" {
  type = list(string)
}

variable "source_ranges" {
  type = list(string)
}

variable "source_ip_ranges_to_nat" {
  type = list(string)
}