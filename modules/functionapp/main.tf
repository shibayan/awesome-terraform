resource "azurerm_application_insights" "default" {
  name                = "appi-function-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
}

resource "azurerm_storage_account" "default" {
  name                     = "stfunctionbackend${var.environment}"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "default" {
  name                = "plan-function-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = "ElasticPremium"
    size = "EP1"
  }
}

resource "azurerm_function_app" "default" {
  name                       = "func-function-${var.environment}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = azurerm_app_service_plan.default.id
  storage_account_name       = azurerm_storage_account.default.name
  storage_account_access_key = azurerm_storage_account.default.primary_access_key
  version                    = "~3"
  enable_builtin_logging     = false

  client_affinity_enabled = false
  https_only              = true

  site_config {
    always_on     = true
    http2_enabled = true
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.default.instrumentation_key
    "FUNCTIONS_WORKER_RUNTIME"       = "dotnet"
    "WEBSITE_RUN_FROM_PACKAGE"       = 1
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "default" {
  app_service_id = azurerm_function_app.default.id
  subnet_id      = var.functionapp_subnet_id
}
