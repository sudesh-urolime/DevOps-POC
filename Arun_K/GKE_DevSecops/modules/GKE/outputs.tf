# GKE Cluster Endpoint
output "cluster_endpoint" {
  description = "The endpoint for the GKE cluster"
  value       = google_container_cluster.privatecluster.endpoint
}

# GKE Cluster Name
output "cluster_name" {
  description = "The name of the GKE cluster"
  value       = google_container_cluster.privatecluster.name
}

# GKE Cluster Master IPv4 CIDR Block
output "master_ipv4_cidr_block" {
  description = "The IPv4 CIDR block for the GKE cluster master nodes"
  value       = google_container_cluster.privatecluster.private_cluster_config.master_ipv4_cidr_block
}

# GKE Cluster Services Secondary Range
output "services_secondary_range" {
  description = "The secondary range for services in the GKE cluster"
  value       = google_container_cluster.privatecluster.ip_allocation_policy.services_secondary_range_name
}

# GKE Cluster Pods Secondary Range
output "cluster_secondary_range" {
  description = "The secondary range for pods in the GKE cluster"
  value       = google_container_cluster.privatecluster.ip_allocation_policy.cluster_secondary_range_name
}

# GKE Node Pool Service Account
output "node_service_account_email" {
  description = "The service account email used by the GKE node pool"
  value       = google_service_account.node_sa.email
}

# GKE Node Pool Name
output "nodepool_name" {
  description = "The name of the GKE node pool"
  value       = google_container_node_pool.privatecluster_node_pool.name
}
