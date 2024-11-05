output "vpc_self_link" {
  description = "Self link of the VPC"
  value       = google_compute_network.vpc_network.self_link
}

output "subnet_self_link" {
  description = "Self link of the subnet"
  value       = google_compute_subnetwork.gke_subnet_private.self_link
}

variable "jump-host" {
  type = string
}