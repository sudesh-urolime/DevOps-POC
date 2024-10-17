# Root module main.tf

module "vpc" {
  source         = "./modules/vpc"                  # Path to the VPC module
  vpc_name       = var.vpc_name   # Name of the VPC
  subnet_name    = var.subnet_name # List of subnet names
  cidr_ranges    = var.cidr_ranges # Corresponding CIDR ranges
  router_name    = var.router_name              # Name of the Cloud Router
  nat_name       = var.nat_name                 # Name of the NAT configuration
  region         = var.region            # GCP region
}

# Bastion Module
module "bastion" {
  source                = "./modules/bastion"  # Path to the bastion module
  vm_name               = var.vm_name
  machine_type          = var.machine_type
  zone                  = var.zone
  vm_image              = var.vm_image
  vpc_name              = var.vpc_name
  subnet_name           = var.subnet_public_name
  region                = var.region
  project_id            = var.project_id
  service_account_email = var.service_account_email
  depends_on = [ module.vpc ]
}

module "gcr" {
     source            = "./modules/Artifact Registry"
     project_id        = var.project_id
     location          = var.location
     repository_id     = var.repository_id
     description       = var.description
     format            = var.format
}

module "gke_private_cluster" {
     source = "./modules/GKE"
     project_id                 = var.project_id
     cluster_name               = var.cluster_name
     vpc_name                   = var.vpc_name
     subnet_name                = var.subnet_name
     cidr_block                 = var.cidr_block
     cidr_display_name          = var.cidr_display_name
     master_ipv4_cidr_block     = var.master_ipv4_cidr_block
     services_secondary_range_name = var.services_secondary_range_name
     cluster_secondary_range_name  = var.cluster_secondary_range_name
     logging_service            = var.logging_service
     monitoring_service         = var.monitoring_service
     nodepool_name              = var.nodepool_name
     node_count                 = var.node_count
     preemptible                = var.preemptible
     node_machine_type          = var.node_machine_type
     node_disk_type             = var.node_disk_type
     node_disk_size_gb          = var.node_disk_size_gb
     node_image_type            = var.node_image_type
     node_service_account_name  = var.node_service_account_name
     node_sa_roles              = var.node_sa_roles
     depends_on = [ module.vpc ]
}