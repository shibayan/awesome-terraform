resource "azurerm_resource_group" "default" {
  name     = "${var.environment}-terraform-test"
  location = var.location
}