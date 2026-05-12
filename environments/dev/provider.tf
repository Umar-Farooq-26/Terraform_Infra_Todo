terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }

  backend "azurerm" {
    resource_group_name   = "backend-rg"
    storage_account_name  = "backenddevstorage"
    container_name        = "backendcontainer"
    key                   = "dev.terraform.tfstate"
    use_azuread_auth = true
  }

}

provider "azurerm" {
  features {}
}