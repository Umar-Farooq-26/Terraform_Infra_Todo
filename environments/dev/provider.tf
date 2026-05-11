terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rgStorage"
    storage_account_name = "umarfarooq0000"
    container_name       = "umarfarooqcontainer"
    key                  = "dev.terraform.tfstate"

  }

}

provider "azurerm" {
  features {}

}