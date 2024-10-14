module "cluster" {
    source = "./modules/cluster"
    roles = var.roles
    master_ipv4_cidr_block = var.master_ipv4_cidr_block
    workern_disksize = var.workern_disksize
    workern_disktype = var.workern_disktype
    workern_imagetype = var.workern_imagetype
    workern_type = var.workern_type
    cluster_name = var.cluster_name
    project_id = var.project_id
    accounts = var.accounts
    nodepool_name = var.nodepool_name
    subnet_names = var.subnet_names
    vpc_name = var.vpc_name
    cidr_ranges = var.cidr_ranges
    region     = var.region
}


module "bastion" {
    source = "./modules/bastion"
    zone = var.zone
    project_id = var.project_id 
    region     = var.region
    vm_image = var.vm_image
    vm_name = var.vm_name
    vpc_name = var.vpc_name
    subnet_names = var.subnet_names
    machine_type = var.machine_type
    # account = var.accounts
}

module "vpc" {
    source = "./modules/vpc"
    cidr_ranges = var.cidr_ranges
    nat_name = var.nat_name
    vpc_name = var.vpc_name
    project_id = var.project_id
    router_name = var.router_name
    subnet_names = var.subnet_names
    region     = var.region
}


module "gcr" {
  source        = "./modules/gcr"
  location      = var.location
  repository_id = var.repository_id
  description   = var.description
  format        = var.format
}


module "storage-bucket" {
  source = "./modules/storage-bucket"
  name                      = var.name
  project_id                = var.project_id
  location                  = var.location
  storage_class             = var.storage_class
  force_destroy             = var.force_destroy
  public_access_prevention  = var.public_access_prevention
  versioning                = var.versioning
  autoclass                 = var.autoclass
  retention_policy          = var.retention_policy  
  bucket_policy_only        = var.bucket_policy_only
}


