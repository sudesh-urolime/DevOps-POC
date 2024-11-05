# Root module main.tf

module "vpc" {
  source         = "./modules/vpc"                  # Path to the VPC module
  cluster_name             = var.cluster_name
  cluster_location         = var.cluster_location
  region                   = var.region
  standard_machine_type    = var.standard_machine_type
  vpc                      = var.vpc
  project                  = var.project
  gke_subnet_name          = var.gke_subnet_name
  gke_subnet_cidr          = var.gke_subnet_cidr
  gke_subnet_cluster_cidr  = var.gke_subnet_cluster_cidr
  gke_subnet_services_cidr = var.gke_subnet_services_cidr
  gke_subnet_region        = var.gke_subnet_region
  ports                    = var.ports
  source_ranges            = var.source_ranges
  source_ip_ranges_to_nat  = var.source_ip_ranges_to_nat
  jump-host                = var.jump-host
  }

# Bastion Module
module "bastion" {
  source                = "./modules/bastion"  # Path to the bastion module
   zone                       = var.zone
  project                     = var.project
  jump-host                   = var.jump-host
  jump-machine                = var.jump-machine
  vpc                         = module.vpc.vpc_self_link
  gke_subnet_name             = module.vpc.subnet_self_link
  vm_image                    = var.vm_image
  # pritunlfile                 = var.pritunlfile
}

module "gcr" {
     source            = "./modules/Artifact Registry"
     project_id        = var.project
     location          = var.location
     repository_id     = var.repository_id
     description       = var.description
     format            = var.format
     depends_on = [ module.vpc ]
}


module "GKE" {
source = "./modules/GKE-Cluster"
region                      = var.region
  project                     = var.project
  cluster_name                = var.cluster_name
  cluster_location            = var.cluster_location
  vpc                         = module.vpc.vpc_self_link
  gke_subnet_name             = module.vpc.subnet_self_link
  gke_subnet_cidr             = var.gke_subnet_cidr
  gke_subnet_cluster_cidr     = var.gke_subnet_cluster_cidr
  gke_subnet_services_cidr    = var.gke_subnet_services_cidr
  master_ipv4_cidr_block      = var.master_ipv4_cidr_block
  gke_subnet_region           = var.gke_subnet_region
  min-master-version          = var.min-master-version
  standard_min_node_count     = var.standard_min_node_count
  standard_max_node_count     = var.standard_max_node_count
  standard_machine_type       = var.standard_machine_type
  node_disk_type = var.node_disk_type
  node_disk_size_gb = var.node_disk_size_gb
}



# ------------------------------------------------------------------------------
# CREATE A RANDOM SUFFIX AND PREPARE RESOURCE NAMES
# ------------------------------------------------------------------------------

resource "random_id" "name" {
  byte_length = 2
}

locals {
  # If name_override is specified, use that - otherwise use the name_prefix with a random string
  instance_name        = var.name_override == null ? format("%s-%s", var.name_prefix, random_id.name.hex) : var.name_override
  private_network_name = "private-network-${random_id.name.hex}"
  private_ip_name      = "private-ip-${random_id.name.hex}"
}

# ------------------------------------------------------------------------------
# CREATE COMPUTE NETWORKS
# ------------------------------------------------------------------------------

# Simple network, auto-creates subnetworks
resource "google_compute_network" "private_network" {
  provider = google-beta
  project = var.project
  name     = local.private_network_name
}

# Reserve global internal address range for the peering
resource "google_compute_global_address" "private_ip_address" {
  provider      = google-beta
  project = var.project
  name          = local.private_ip_name
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.private_network.self_link
}

# Establish VPC network peering connection using the reserved address range
resource "google_service_networking_connection" "private_vpc_connection" {
  provider                = google-beta
  network                 = google_compute_network.private_network.self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}

# ------------------------------------------------------------------------------
# CREATE DATABASE INSTANCE WITH PRIVATE IP
# ------------------------------------------------------------------------------

module "mysql" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "github.com/gruntwork-io/terraform-google-sql.git//modules/cloud-sql?ref=v0.2.0"
  source = "./modules/cloudsql"

  project = var.project
  region  = var.region
  name    = local.instance_name
  db_name = var.db_name

  engine       = var.mysql_version
  machine_type = var.machine_type_sql

  # To make it easier to test this example, we are disabling deletion protection so we can destroy the databases
  # during the tests. By default, we recommend setting deletion_protection to true, to ensure database instances are
  # not inadvertently destroyed.
  deletion_protection = false

  # These together will construct the master_user privileges, i.e.
  # 'master_user_name'@'master_user_host' IDENTIFIED BY 'master_user_password'.
  # These should typically be set as the environment variable TF_VAR_master_user_password, etc.
  # so you don't check these into source control."
  master_user_password = var.master_user_password

  master_user_name = var.master_user_name
  master_user_host = "%"

  # Pass the private network link to the module
  private_network = google_compute_network.private_network.self_link

  # Wait for the vpc connection to complete
  dependencies = [google_service_networking_connection.private_vpc_connection.network]

  # Set auto-increment flags to test the
  # feature during automated testing
  database_flags = [
    {
      name  = "auto_increment_increment"
      value = "6"
    },
    {
      name  = "auto_increment_offset"
      value = "6"
    },
  ]

  custom_labels = {
    test-id = "mysql-private-ip-example"
  }
}
