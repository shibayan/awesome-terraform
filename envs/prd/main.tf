provider "azurerm" {
  version = "~> 2.0"
  features {}
}

module "common" {
  source = "../../modules/"

  environment = "prd"
  location    = "japaneast"
}
