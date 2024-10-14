project_id = "drproject-gcp-aws"
vpc_name = "prod-vpc"
subnet_names = ["public", "private-subnet"]
cidr_ranges = ["10.0.0.0/24","10.0.1.0/24"]
bucket_name = "furniture-log"
region = "us-central1"
bucket_class = "STANDARD"
router_name = "prod-router"
nat_name = "prod-nat"
zone = "us-central1-b"
vm_name = "private-vm"
machine_type = "n1-standard-1"
vm_image = "debian-cloud/debian-11"
master_ipv4_cidr_block = "172.16.0.0/28"
nodepool_name = "node-pool"
cluster_name = "privatecluster"
workern_type = "e2-micro"
workern_disktype = "pd-standard"
workern_disksize = 50
workern_imagetype = "ubuntu_containerd"
workern_oauthscopes = ["https://www.googleapis.com/auth/cloud-platform"]
accounts = ["gke-sa", "instance-sa"]
roles = ["roles/storage.objectViewer", "roles/container.admin"]

# GCR (Google Container Registry) Module Variables
location      = "us-central1"            # Region where the GCR repository will be created
repository_id = "furniture-gcr"                # ID for the GCR repository
description   = "Container registry for furniture app"  # Description for the GCR repository
format        = "DOCKER"                 # Repository format (DOCKER or other supported formats)

# Storage Bucket Module Variables
name                      = "application-data-sync"       # Name of the storage bucket
# project_id                = "my-gcp-project-id"       # GCP project ID
# location                  = "us-central1"             # Region for the storage bucket
storage_class             = "STANDARD"                # Storage class (e.g., STANDARD, NEARLINE, COLDLINE)
force_destroy             = true                      # Set to true to allow bucket deletion even if it contains objects
public_access_prevention  = "enforced"                # Set to "enforced" or "inherited" for public access prevention
versioning                = true                      # Enable versioning for the bucket
autoclass                 = false                     # Enable or disable Autoclass feature for bucket storage optimization
# retention_policy          = 30                        # Number of days for retention policy
retention_policy = {
  is_locked        = false  # Set to true if the retention policy should be locked
  retention_period = 30     # Number of days for retention policy
}
bucket_policy_only        = true                      # Enable bucket policy only (uniform bucket-level access)
