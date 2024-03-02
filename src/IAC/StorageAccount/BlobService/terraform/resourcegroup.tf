resource "azurerm_resource_group" "main" {
  name     = local.resource_group_name
  location = local.location
}