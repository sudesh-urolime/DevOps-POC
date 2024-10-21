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

  backend "azurerm" {
    resource_group_name  = "project-1"
    storage_account_name = "urolimeproject1storage"
    container_name       = "s3container"
    key                  = "prod-terraform.tfstate"
  }
}

provider "azurerm" {
  features {

  
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
