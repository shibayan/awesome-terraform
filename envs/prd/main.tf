provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = "~> 2.0"
  }
}

module "common" {
  source = "../../modules/"

  environment = "prd"
  location    = "japaneast"
}
