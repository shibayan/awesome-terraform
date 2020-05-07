resource "azurerm_app_service_plan" "default" {
  name                = "ASP-Default-01"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name

  sku {
    tier = "PremiumV2"
    size = "P1v2"
  }
}