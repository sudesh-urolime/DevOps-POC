resource "google_artifact_registry_repository" "repo" {

  repository_id = var.repository_id
  location      = var.location
  format        = var.format
  project       = var.project_id
  description   = var.description
}