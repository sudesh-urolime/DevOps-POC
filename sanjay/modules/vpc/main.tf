resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

# Subnetworks with updated CIDR ranges
resource "google_compute_subnetwork" "subnets" {
  count         = length(var.cidr_ranges)
  name          = var.subnet_names[count.index]
  ip_cidr_range = var.cidr_ranges[count.index]
  network       = google_compute_network.vpc_network.name
  region        = var.region
}

# Firewall Rule - updated with a unique name to avoid conflicts
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh-new"  # Changed name to avoid conflict
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_tags  = ["private-vm"]
  source_ranges = ["0.0.0.0/0"]
}

# Cloud Router
resource "google_compute_router" "task_router" {
  name    = var.router_name
  network = google_compute_network.vpc_network.id
  region  = var.region
}

# Cloud Router NAT
resource "google_compute_router_nat" "task_nat" {
  name                               = var.nat_name
  router                             = google_compute_router.task_router.name
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.subnets[0].id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}