resource "azurerm_application_insights" "default" {
  name                = "appi-appservice-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
}

resource "azurerm_service_plan" "default" {
  name                = "plan-appservice-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name

  os_type  = "Windows"
  sku_name = "P1v2"
}

resource "azurerm_windows_web_app" "default" {
  name                = "app-appservice-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name

  service_plan_id = azurerm_service_plan.default.id

  client_affinity_enabled = false
  https_only              = true

  site_config {
    always_on     = true
    http2_enabled = true

    application_stack {
      dotnet_version = "v6.0"
    }
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.default.instrumentation_key
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "default" {
  app_service_id = azurerm_windows_web_app.default.id
  subnet_id      = var.webapp_subnet_id
}
