provider "azurerm" {
  version = "~> 2.0"
  features {}
}

terraform {
  backend "azurerm" {}
}

module "common" {
  source = "../../modules/"

  environment = "dev"
  location    = "japaneast"
}