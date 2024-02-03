data "azurerm_resource_group" "main" {
  name = "rg-${var.suffix}-001"
}

data "azurerm_virtual_machine" "main" {
  resource_group_name = data.azurerm_resource_group.main.name
  name                = "vm-${var.suffix}-001"
}