# # bastion/main.tf

# # Reference an existing subnetwork using the data block
# data "google_compute_subnetwork" "existing_subnet" {
#   name    = var.subnet_names[0]  # The name of the subnetwork
#   region  = var.region
#   project = var.project_id
# }

# # Create a private VM instance in the existing subnet
# resource "google_compute_instance" "private_vm" {
#   name         = var.vm_name
#   machine_type = var.machine_type
#   zone         = var.zone
#   tags         = ["private-vm"]

#   # Boot disk configuration
#   boot_disk {
#     initialize_params {
#       image = var.vm_image
#     }
#   }

#  # Scratch disk configuration
# # scratch_disk {
#  #   interface = "SCSI"
#  #}

#   # Network interface configuration
#   network_interface {
#     network    = "projects/${var.project_id}/global/networks/${var.vpc_name}"
#     subnetwork = data.google_compute_subnetwork.existing_subnet.self_link
#   }

#   # Service account configuration
#   service_account {
#     email  = var.service_account_email
#     scopes = ["cloud-platform"]
#   }
# }



# Reference an existing subnetwork using the data block
data "google_compute_subnetwork" "existing_subnet" {
  name    = var.subnet_name  # Use a single subnet name for clarity
  region  = var.region
  project = var.project_id
}

# Create a private VM instance in the existing subnet
resource "google_compute_instance" "private_vm" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["private-vm"]

  # Boot disk configuration
  boot_disk {
    initialize_params {
      image = var.vm_image
    }
  }

  # Network interface configuration
  network_interface {
    network    = "projects/${var.project_id}/global/networks/${var.vpc_name}"
    subnetwork = data.google_compute_subnetwork.existing_subnet.self_link  # Ensure the subnetwork is properly linked
  }

  # Service account configuration
  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}
