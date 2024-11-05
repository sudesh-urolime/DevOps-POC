resource "google_compute_instance" "private_vm" {
  name         = var.jump-host
  machine_type = var.jump-machine 
  zone         = var.zone
  tags         = ["private-vm"]
  

  boot_disk {
    initialize_params{
      image = var.vm_image
    }
  }

  network_interface {
    network = var.vpc
    subnetwork = var.gke_subnet_name
    access_config {
      // Ephemeral IP will be automatically assigned
    }
  }
}


