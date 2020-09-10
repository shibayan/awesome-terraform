provider "azurerm" {
  version = "~> 2.0"
  features {}
}

module "common" {
  source = "../../modules/"

  environment = "dev"
  location    = "japaneast"
}
