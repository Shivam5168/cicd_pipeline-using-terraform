output "resource_group_name_output" {
  value = data.azurerm_resource_group.resource_group.name
}

output "location_output" {
  value = data.azurerm_resource_group.resource_group.location
}