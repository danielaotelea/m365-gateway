# Provider Configuration
provider "azurerm" {
  features {}
}
# Resource Definitions
resource "azurerm_resource_group" "example" {
  name     = local.resource_group_name
  location = local.resource_group_location
}

resource "azurerm_storage_account" "example" {
  name                     = local.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "example" {
  name                = local.service_plan_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_application_insights" "example" {
  name                = local.application_insights_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  application_type    = "web"
}

# Not supported in the current area
#resource "azurerm_log_analytics_workspace" "example" {
#  location            = local.log_analytics_workspace_name
#  name                = azurerm_resource_group.example.location
#  resource_group_name = azurerm_resource_group.example.name
#  retention_in_days   = 30
#}


resource "azurerm_linux_function_app" "example" {
  name                        = local.function_java_app_name
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  storage_account_name        = azurerm_storage_account.example.name
  storage_account_access_key  = azurerm_storage_account.example.primary_access_key
  service_plan_id             = azurerm_service_plan.example.id
  functions_extension_version = local.functions_extension_version
  site_config {
    application_stack {
      java_version = local.java_version
    }
  }
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.example.instrumentation_key
  }
  depends_on = [azurerm_storage_account.example]
}

resource "azurerm_linux_function_app" "example2" {
  name                        = local.function_ps_app_name
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  storage_account_name        = azurerm_storage_account.example.name
  storage_account_access_key  = azurerm_storage_account.example.primary_access_key
  service_plan_id             = azurerm_service_plan.example.id
  functions_extension_version = local.functions_extension_version
  app_settings                = {
    "FUNCTIONS_WORKER_RUNTIME"         = "powershell"
    "FUNCTIONS_WORKER_RUNTIME_VERSION" = "7.0"
    "APPINSIGHTS_INSTRUMENTATIONKEY"   = azurerm_application_insights.example.instrumentation_key
  }
  site_config {
    linux_fx_version = "Powershell|7.0"
  }
  depends_on = [azurerm_storage_account.example]
}

resource "azurerm_storage_container" "example" {
  name                  = local.container_name
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.example]
}
