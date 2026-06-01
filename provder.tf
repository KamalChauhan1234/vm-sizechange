terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # Backend add kiya
  backend "azurerm" {
    resource_group_name  = "rg-vm"
    storage_account_name = "tfstatevmresize"
    container_name       = "tfstate"
    key                  = "vm1.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}