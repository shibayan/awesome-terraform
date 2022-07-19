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

resource "azurerm_service_plan" "default" {
  name                = "plan-function-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name

  os_type  = "Windows"
  sku_name = "EP1"
}

resource "azurerm_windows_function_app" "default" {
  name                = "func-function-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name

  service_plan_id      = azurerm_service_plan.default.id
  storage_account_name = azurerm_storage_account.default.name

  functions_extension_version = "~4"
  https_only                  = true

  site_config {
    application_insights_connection_string = azurerm_application_insights.default.connection_string
    http2_enabled                          = true

    application_stack {
      dotnet_version = "6"
    }
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = 1
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "default" {
  app_service_id = azurerm_windows_function_app.default.id
  subnet_id      = var.functionapp_subnet_id
}
