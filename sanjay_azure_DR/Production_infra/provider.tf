terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

# backend "azurerm" {
#   resource_group_name  = "Dr_azure"
#   storage_account_name = "statefilestoragesanjay"
#   container_name       = "statefilestoragesanjay"
#   key                  = "terraform.tfstate"
# }

terraform {
  backend "azurerm" {
    resource_group_name  = "Dr_azure"
    storage_account_name = "statefilestoragesanjay"
    container_name       = "statefilestoragesanjay"
    key                  = "terraform.tfstate"
  }
}


provider "azurerm" {
  features {}
}