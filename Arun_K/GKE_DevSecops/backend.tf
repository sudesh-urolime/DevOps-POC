terraform {
 backend "gcs" {
   bucket  = "application-tfstate-121321"
   prefix  = "terraform/state"
 }
}