# backend.tf
terraform {
  backend "azurerm" {
    resource_group_name  = "azurepoc-tfstate-rg"
		storage_account_name = "azurepoctfa018fjmk"
 		container_name       = "core-tfstate"
    key                  = "terraform.tfstate"
  }
}
