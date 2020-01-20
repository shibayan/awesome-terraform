resource "azurerm_app_service" "default" {
  name                = "${var.environment}-appservice-01"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  app_service_plan_id = azurerm_app_service_plan.default.id
}

resource "azurerm_app_service_virtual_network_swift_connection" "default" {
  app_service_id = azurerm_app_service.default.id
  subnet_id      = azurerm_subnet.appservice.id
}