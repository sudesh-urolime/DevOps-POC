terraform {
  backend "azurerm" {
    resource_group_name  = "tfstatepoc"
    storage_account_name = "tfstateprod1213"
    container_name       = "tfstateprod"
    key                  = "terraform.tfstate"
  }
}