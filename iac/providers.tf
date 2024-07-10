# Provider Configuration
provider "azurerm" {
  features {}
}

# Backend configuration - store the state file in Azure Storage
terraform {
  backend "azurerm" {
    resource_group_name  = "m365-gateway-git"
    storage_account_name = "m365functionsstoragegit"
    container_name       = "m365-gateway-container"
    key                  = "terraform.tfstate"
  }
}
