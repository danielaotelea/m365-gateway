locals {
  resource_group_name          = "m365-gateway-rg"
  resource_group_location      = "westeurope"
  storage_account_name         = "m365storageaccount"
  service_plan_name            = "m365-app-service-plan"
  application_insights_name    = "m365-app-insights"
  log_analytics_workspace_name = "m365-log-analytics"
  function_app_name            = "m365-functions"
  functions_extension_version  = "~4"
  java_version                 = "17"
}
