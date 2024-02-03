data "azurerm_resource_group" "main" {
  name = "rg-${var.suffix}-001"
}

data "azurerm_virtual_network" "main" {
  name                = "vnet-${var.suffix}-001"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "azurerm_subnet" "internal" {
  name                 = "snet-${var.suffix}-001"
  resource_group_name  = data.azurerm_resource_group.main.name
  virtual_network_name = data.azurerm_virtual_network.main.name
}

