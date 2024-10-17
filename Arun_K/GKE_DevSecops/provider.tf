#GCP Provider
provider "google" {
  # credentials = file("Terraform-GKE/gcp-cicd-devsecops.json")
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}