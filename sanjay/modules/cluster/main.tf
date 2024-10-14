resource "google_container_cluster" "privatecluster" {
  name               = var.cluster_name
  location           = var.region
  network            = var.vpc_name
  subnetwork         = var.subnet_names[1]

  remove_default_node_pool = true
  initial_node_count       = 1

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.cidr_ranges[0]
      display_name = var.subnet_names[0]
    }
  }

  private_cluster_config {
    enable_private_nodes     = true
    enable_private_endpoint  = true
    master_ipv4_cidr_block   = var.master_ipv4_cidr_block
  }

  ip_allocation_policy {}
}

resource "google_container_node_pool" "privatecluster-node-pool" {
  name       = var.nodepool_name
  cluster    = google_container_cluster.privatecluster.name
  location   = var.region
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = var.workern_type
    disk_type    = var.workern_disktype
    disk_size_gb = var.workern_disksize
    image_type   = var.workern_imagetype
    service_account = google_service_account.sa[0].email
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
  }
  depends_on = [google_container_cluster.privatecluster]  # Ensures cluster is created first
}

resource "google_service_account" "sa" {
  count      = length(var.accounts)
  account_id = var.accounts[count.index]
}

resource "google_project_iam_member" "sa-with-roles" {
  count    = length(var.roles)
  project  = var.project_id
  role     = var.roles[count.index]
  member   = "serviceAccount:${google_service_account.sa[count.index].email}"
}
