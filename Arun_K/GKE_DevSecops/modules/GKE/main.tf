resource "google_container_cluster" "privatecluster" {
  name       = var.cluster_name
  network    = var.vpc_name
  subnetwork = var.subnet_name

  remove_default_node_pool = true
  initial_node_count       = 1

  # Authorized networks for access to the control plane
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.cidr_block
      display_name = var.cidr_display_name
    }
  }

  # Private cluster configuration
  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

  # IP allocation policy
  ip_allocation_policy {
    services_secondary_range_name = var.services_secondary_range_name
    cluster_secondary_range_name  = var.cluster_secondary_range_name
  }

  # Logging and monitoring settings
  logging_service   = var.logging_service
  monitoring_service = var.monitoring_service
}

# Node pool for the GKE private cluster
resource "google_container_node_pool" "privatecluster_node_pool" {
  name    = var.nodepool_name
  cluster = google_container_cluster.privatecluster.name
  node_count = var.node_count

  node_config {
    preemptible     = var.preemptible
    machine_type    = var.node_machine_type
    disk_type       = var.node_disk_type
    disk_size_gb    = var.node_disk_size_gb
    image_type      = var.node_image_type
    service_account = google_service_account.node_sa.email

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  upgrade_settings {
    max_surge = 1
    max_unavailable = 0
  }

  lifecycle {
    ignore_changes = [node_count] # Ignore changes in node count to avoid unnecessary re-creations
  }
}

# Create a service account for the GKE node pool
resource "google_service_account" "node_sa" {
  account_id   = var.node_service_account_name
  display_name = "GKE Node Pool Service Account"
}

# Assign roles to the service account
resource "google_project_iam_member" "node_sa_roles" {
  for_each = toset(var.node_sa_roles)
  project  = var.project_id
  role     = each.value
  member   = "serviceAccount:${google_service_account.node_sa.email}"
}
