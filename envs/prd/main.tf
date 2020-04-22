provider "azurerm" {
  version = "~> 2.0"
  features {}
}

terraform {
  backend "azurerm" {}
}

module "common" {
  source = "../../modules/"

  environment = "prd"
  location    = "japaneast"
}