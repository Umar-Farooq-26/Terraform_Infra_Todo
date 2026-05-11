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

  subscription_id = "55e255f2-e37a-47b4-bdc9-8d1f4a8d391c"

}