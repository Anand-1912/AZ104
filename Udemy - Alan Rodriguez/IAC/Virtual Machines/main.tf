
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

# Resource Block and the configuration of the resources

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = "rg-${var.suffix}-001"
  location = var.location
}

# VNet
resource "azurerm_virtual_network" "main" {
  name = "vnet-${var.suffix}-001"
  resource_group_name = azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location
  address_space =["10.0.0.0/16"]
}

# Subnet

resource "azurerm_subnet" "internal" {
  name = "snet-${var.suffix}-001"
  resource_group_name = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes = ["10.0.0.0/24"]
}


# NIC

resource "azurerm_network_interface" "main" {
  name = "nic-${var.suffix}-001"
  resource_group_name = azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location
  ip_configuration {
    name = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id = azurerm_subnet.internal.id
  }
}

# VM
resource "azurerm_windows_virtual_machine" "main" {
  name = "vm-${var.suffix}-001"
  resource_group_name = azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location
  network_interface_ids = [azurerm_network_interface.main.id]
  admin_username = "adminuser"
  admin_password = "P@ssw0rd1234!"
  size ="Standard_B1s"
  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
} 
