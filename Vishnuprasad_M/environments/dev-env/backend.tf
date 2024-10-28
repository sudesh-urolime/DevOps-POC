terraform {
  backend "azurerm" {
    resource_group_name  = "tfstatepoc"
    storage_account_name = "tfstatedev1213"
    container_name       = "tfstatedev"
    key                  = "terraform.tfstate"
  }
}