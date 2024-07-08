provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "m365-gateway-git"
  location = "westeurope"
}

resource "azurerm_storage_account" "example" {
  name                     = "m365functionsstoragegit"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "example" {
  name                = "m365-app-service-plan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_application_insights" "example" {
  name                = "m365-app-insights"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  application_type    = "web"
}


resource "azurerm_linux_function_app" "example" {
  name                        = "m365-functions"
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  storage_account_name        = azurerm_storage_account.example.name
  storage_account_access_key  = azurerm_storage_account.example.primary_access_key
  service_plan_id             = azurerm_service_plan.example.id
  functions_extension_version = "~4"
  site_config {
    application_stack {
      java_version = "17"
    }
  }
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.example.instrumentation_key
  }
}
