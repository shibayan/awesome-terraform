provider "azurerm" {
}

terraform {
  backend "azurerm" {}
}

module "common" {
  source = "../../modules/"

  environment = "dev"
  location    = "japaneast"
}