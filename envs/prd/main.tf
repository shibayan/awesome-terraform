provider "azurerm" {
}

terraform {
  backend "azurerm" {}
}

module "common" {
  source = "../../modules/"

  environment = "prd"
  location    = "japaneast"
}