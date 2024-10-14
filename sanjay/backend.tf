terraform {
 backend "gcs" {
   bucket  = "application_end"
   prefix  = "terraform/state"
 }
}