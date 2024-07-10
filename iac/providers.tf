# Provider Configuration
provider "azurerm" {
  features {}
}

# Backend configuration - store the state file in Azure Storage
terraform {
  backend "azurerm" {
  }
}
