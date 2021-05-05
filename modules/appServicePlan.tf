resource "azurerm_app_service_plan" "default" {
  name                = "plan-${var.environment}-001"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name

  sku {
    tier = "PremiumV3"
    size = "P1v3"
  }
}
