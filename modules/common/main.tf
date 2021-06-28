resource "azurerm_resource_group" "default" {
  name     = "rg-terraform-${var.environment}"
  location = var.location
}

resource "azurerm_virtual_network" "default" {
  name                = "vnet-${var.environment}"
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "webapp" {
  name                 = "snet-webapp"
  resource_group_name  = azurerm_resource_group.default.name
  virtual_network_name = azurerm_virtual_network.default.name
  address_prefixes     = ["10.0.0.0/24"]
  service_endpoints    = ["Microsoft.AzureCosmosDB"]

  delegation {
    name = "webapp_delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_subnet" "functionapp" {
  name                 = "snet-functionapp"
  resource_group_name  = azurerm_resource_group.default.name
  virtual_network_name = azurerm_virtual_network.default.name
  address_prefixes     = ["10.0.1.0/24"]

  delegation {
    name = "functionapp_delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_cosmosdb_account" "default" {
  name                = "cosmos-${var.environment}"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover         = true
  is_virtual_network_filter_enabled = true

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = azurerm_resource_group.default.location
    failover_priority = 0
  }

  virtual_network_rule {
    id                                   = azurerm_subnet.webapp.id
    ignore_missing_vnet_service_endpoint = false
  }

  virtual_network_rule {
    id                                   = azurerm_subnet.functionapp.id
    ignore_missing_vnet_service_endpoint = false
  }
}
