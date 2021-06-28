provider "azurerm" {
  features {}
}

terraform {
  #backend "azurerm" {}

  required_providers {
    azurerm = "~> 2.0"
  }
}

module "common" {
  source = "../../modules/common"

  environment = "dev"
  location    = "japaneast"
}

module "functionapp" {
  source = "../../modules/functionapp"

  environment           = "dev"
  resource_group_name   = module.common.resource_group_name
  location              = "japaneast"
  functionapp_subnet_id = module.common.functionapp_subnet_id
}

module "webapp" {
  source = "../../modules/webapp"

  environment         = "dev"
  resource_group_name = module.common.resource_group_name
  location            = "japaneast"
  webapp_subnet_id    = module.common.webapp_subnet_id
}
