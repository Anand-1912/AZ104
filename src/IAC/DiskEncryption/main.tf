provider "azurerm" {
  features {}
}

resource "azurerm_app_service_plan" "example" {
  name                = "example-appservice-plan"
  location            = "East US"
  resource_group_name = azurerm_resource_group.example.name
  kind                = "Windows"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

resource "azurerm_app_service" "example" {
  name                = "example-appservice"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    # Disable public access
    
  }
}
