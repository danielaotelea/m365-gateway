# Provider Configuration
provider "azurerm" {
  features {}
}

# Backend configuration - store the state file in Azure Storage
terraform {
  backend "azurerm" {
    resource_group_name  = azurerm_resource_group.example.name
    storage_account_name = azurerm_storage_account.example.name
    container_name       = "m365-gateway-container"
    key                  = "terraform.tfstate"
  }
}
