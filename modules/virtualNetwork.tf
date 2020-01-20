resource "azurerm_virtual_network" "default" {
  name                = "${var.environment}-vnet"
  resource_group_name = azurerm_resource_group.default.name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.default.location
}

resource "azurerm_subnet" "appservice" {
  name                 = "appservice"
  resource_group_name  = azurerm_resource_group.default.name
  virtual_network_name = azurerm_virtual_network.default.name
  address_prefix       = "10.0.0.0/24"
  service_endpoints    = ["Microsoft.Web"]

  delegation {
    name = "appservice_delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}