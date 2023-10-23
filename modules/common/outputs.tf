output "resource_group_name" {
  value = azurerm_resource_group.default.name
}

output "functionapp_subnet_id" {
  value = azurerm_subnet.functionapp.id
}

output "webapp_subnet_id" {
  value = azurerm_subnet.webapp.id
}

output "cosmos_connection_string" {
  value     = azurerm_cosmosdb_account.default.primary_sql_connection_string
  sensitive = true
}
