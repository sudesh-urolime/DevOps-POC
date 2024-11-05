resource "google_compute_network" "vpc_network" {
  name                    = var.vpc
  auto_create_subnetworks = false
  project                 = var.project
}

resource "google_compute_subnetwork" "gke_subnet_private" {
  # count = length(var.secondary_ip_range)
  name                     = var.gke_subnet_name
  network                  = google_compute_network.vpc_network.self_link
  ip_cidr_range            = var.gke_subnet_cidr
  private_ip_google_access = true
  project                  = var.project
  region                   = var.gke_subnet_region
}

resource "google_compute_router" "router" {
  name    = "${var.cluster_name}-router"
  region  = var.region
  network = google_compute_network.vpc_network.id
  project = var.project
}
resource "google_compute_router_nat" "nat" {
  name    = "${var.cluster_name}-nat"
  project = var.project
  router  = google_compute_router.router.name
  region  = var.region

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.gke_subnet_private.id
    source_ip_ranges_to_nat = var.source_ip_ranges_to_nat
  }

  nat_ips = [google_compute_address.nat.self_link]
}

resource "google_compute_address" "nat" {
  name         = "${var.cluster_name}-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  project      = var.project
  region       = var.region
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.cluster_name}-allow-ssh"
  project = var.project
  network = google_compute_network.vpc_network.name
 
  allow {
    protocol = "tcp"
    ports    = var.ports
  }

  source_ranges = var.source_ranges
  target_tags   = ["${var.cluster_name}"]
}

resource "google_compute_firewall" "bastion_firewall" {
  depends_on = [google_compute_network.vpc_network]
  name        = "bastion-firewall"
  network     =  var.vpc
  project = var.project
  description = "Allow SSH, HTTP, and HTTPS traffic for bastion server"
  
  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]  
  target_tags   = ["${var.jump-host}"]
}