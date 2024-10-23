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

terraform {
  backend "azurerm" {
    resource_group_name  = "Dr_azure_poc"
    storage_account_name = "statefilestoragesanjay12"
    container_name       = "statefilestoragesanjay"
    key                  = "sajay-terraform.tfstate"
  }
}


provider "azurerm" {
  features {

    resource_group {
      prevent_deletion_if_contains_resources = false
    }

  }
}
