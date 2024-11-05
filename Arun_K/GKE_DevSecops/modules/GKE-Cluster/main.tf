# https://www.terraform.io/docs/providers/google/r/container_cluster.html
resource "google_container_cluster" "cluster" {
  provider = google-beta
  name     = var.cluster_name
  location = var.cluster_location
  project = var.project
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.vpc
  # subnetwork               = google_compute_subnetwork.gke_subnet.name
  subnetwork               = var.gke_subnet_name
  min_master_version       = var.min-master-version

  
  addons_config {
    
    network_policy_config {
      disabled = false
    }
    
    http_load_balancing {
      disabled = true
    }

  }

  network_policy {
    enabled  = true
    provider = "CALICO"
  }

  
  ip_allocation_policy {
    
    cluster_ipv4_cidr_block  = var.gke_subnet_cluster_cidr

    services_ipv4_cidr_block = var.gke_subnet_services_cidr
    

  }
  // we will be using istio services for these
  logging_service    = "none"
  monitoring_service = "none"


  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }
  master_authorized_networks_config {
  cidr_blocks {
    cidr_block = var.gke_subnet_cidr
    display_name = "${var.gke_subnet_name}-private"
  }
}

}

# https://www.terraform.io/docs/providers/google/r/container_node_pool.html
resource "google_container_node_pool" "standard" {
  provider = google-beta

  name     = "${var.cluster_name}-standard"
  location = var.cluster_location
  project = var.project
  cluster  = google_container_cluster.cluster.name


  # Node management configuration, wherein auto-repair and auto-upgrade is configured.
  management {
    auto_repair  = "true"
    auto_upgrade = "true"
  }

  autoscaling {
    min_node_count = var.standard_min_node_count
    max_node_count = var.standard_max_node_count
  }


  # initial_node_count = var.standard_min_node_count

  node_config {
    machine_type = var.standard_machine_type

    # The metadata key/value pairs assigned to instances in the cluster.
     disk_type = "pd-standard"
     disk_size_gb    = var.node_disk_size_gb
    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]

    # Tags are used to identify valid sources or targets for network firewalls.
    tags = ["${var.cluster_name}"]
  }



  # Change how long update operations on the node pool are allowed to take
  # before being considered to have failed. The default is 10 mins.
  timeouts {
    update = "20m"
  }

}

