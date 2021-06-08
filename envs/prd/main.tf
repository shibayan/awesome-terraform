provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}

  required_providers {
    azurerm = "~> 2.0"
  }
}

module "common" {
  source = "../../modules/"

  environment = "prd"
  location    = "japaneast"
}
