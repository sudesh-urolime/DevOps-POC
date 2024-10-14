resource "google_compute_instance" "private_vm" {
  name         = var.vm_name
  machine_type = var.machine_type 
  zone         = var.zone
  tags         = ["private-vm"]

  boot_disk {
    initialize_params {
      image = var.vm_image
    }
  }

  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network    = var.vpc_name
    # Updated the subnetwork to dynamically reference project, region, and subnetwork
    subnetwork = "projects/${var.project_id}/regions/${var.region}/subnetworks/${var.subnet_names[0]}"
  }
  
  service_account {
    email  = "dr-aws-gcp@drproject-gcp-aws.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}
