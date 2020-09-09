resource "azurerm_resource_group" "default" {
  name     = "rg-terraform-${var.environment}"
  location = var.location
}