data "azurerm_resource_group" "rg-apim" {
  name = var.resource_group_name
}

output "rg-apim-id" {
  value = data.azurerm_resource_group.rg-apim.id
}

data "azurerm_api_management" "apim" {
  name                = var.apim_service_name
  resource_group_name = var.resource_group_name
}

output "api_management_id" {
  value = data.azurerm_api_management.apim.id
}