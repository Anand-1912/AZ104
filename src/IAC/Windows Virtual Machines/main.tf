
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
  name                = "vnet-${var.suffix}-001"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  address_space       = ["10.0.0.0/16"]
}

# Subnet
resource "azurerm_subnet" "internal" {
  name                 = "snet-${var.suffix}-001"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.0.0/24"]
}

# Public IP
resource "azurerm_public_ip" "main" {
  name                = "pip-${var.suffix}-001"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  allocation_method   = "Static"
}

# NIC
resource "azurerm_network_interface" "main" {
  name                = "nic-${var.suffix}-001"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.internal.id
    public_ip_address_id          = azurerm_public_ip.main.id
  }
}

# Network Security Group
resource "azurerm_network_security_group" "main" {
  name                = "nsg-${var.suffix}-001"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

# Network Security Rules => This can be created using Forreach and Modules
resource "azurerm_network_security_rule" "rdp" {
  name                        = "Allow_RDP"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.main.name #mapping Security Rule with NSG
}

resource "azurerm_network_security_rule" "http_inbound" {
  name                        = "Allow_Http"
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.main.name #mapping Security Rule with NSG
}

resource "azurerm_network_security_rule" "https_inbound" {
  name                        = "Allow_Https"
  priority                    = 1003
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.main.name #mapping Security Rule with NSG
}

# Associating NIC and NSG
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = azurerm_network_security_group.main.id
}

# VM
resource "azurerm_windows_virtual_machine" "main" {
  name                  = "vm-${var.suffix}-001"
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  network_interface_ids = [azurerm_network_interface.main.id]
  admin_username        = "adminuser"
  admin_password        = "P@ssw0rd1234!"
  size                  = var.vm_size
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

# Custom Script Extension

resource "azurerm_virtual_machine_extension" "main" {

  name = "vm-iis-extension-001"
  virtual_machine_id = azurerm_windows_virtual_machine.main.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.8"

  settings = <<SETTINGS
  {
    "commandToExecute": "powershell -ExecutionPolicy Unrestricted Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
  }
SETTINGS


}