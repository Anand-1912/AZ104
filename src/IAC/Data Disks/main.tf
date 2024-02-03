# Terraform Block
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2" #Version constraint of the azurerm provider
    }
  }
  # Required Version of the Terraform
  required_version = ">=1.1.0"
}

# Provider Block and its configuration
provider "azurerm" {
  features {
  }
}


resource "azurerm_managed_disk" "main" {
  name                 = "disk-${var.suffix}-001"
  location             = data.azurerm_resource_group.main.location
  resource_group_name  = data.azurerm_resource_group.main.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "main" {
  managed_disk_id    = azurerm_managed_disk.main.id
  virtual_machine_id = data.azurerm_virtual_machine.main.id
  lun                = "10"
  caching            = "ReadWrite"
}