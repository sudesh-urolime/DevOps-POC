#GCP Provider
provider "google" {
  # credentials = file("Terraform-GKE/gcp-cicd-devsecops.json")
  project = var.project
  region  = var.region
  zone    = var.zone
}
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 3.57.0"
    }
  }
}
