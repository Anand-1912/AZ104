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

provider "azurerm" {
  features {

  }
}

# Public IP
resource "azurerm_public_ip" "main" {
  name                = "pip-${var.suffix}-${local.name_suffix}"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  allocation_method   = "Static"
}

# NIC

resource "azurerm_network_interface" "main" {
  name                = "nic-${var.suffix}-${local.name_suffix}"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = data.azurerm_subnet.internal.id
    public_ip_address_id          = azurerm_public_ip.main.id
  }
}

# Network Security Group
resource "azurerm_network_security_group" "main" {
  name                = "nsg-${var.suffix}-${local.name_suffix}"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
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
  resource_group_name         = data.azurerm_resource_group.main.name
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
  resource_group_name         = data.azurerm_resource_group.main.name
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
  resource_group_name         = data.azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.main.name #mapping Security Rule with NSG
}

resource "azurerm_network_security_rule" "telnet" {
  name                        = "Allow_telnet"
  priority                    = 1004
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = data.azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.main.name #mapping Security Rule with NSG
}

# Associating NIC and NSG
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = azurerm_network_security_group.main.id
}

# Linux VM
resource "azurerm_linux_virtual_machine" "main" {

  name                            = "linuxvm-${var.suffix}-${local.name_suffix}"
  resource_group_name             = data.azurerm_resource_group.main.name
  location                        = data.azurerm_resource_group.main.location
  size                            = var.vm_size
  admin_username                  = "linuxadminuser"
  admin_password                  = "P@ssw0rd1234!"
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.main.id]
  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

}

# resource "azurerm_virtual_machine_extension" "example" {
#   name                 = "vm-nginx-extension-${local.name_suffix}"
#   virtual_machine_id   = azurerm_linux_virtual_machine.main.id
#   publisher            = "Microsoft.Azure.Extensions"
#   type                 = "CustomScript"
#   type_handler_version = "2.0"

#   settings = <<SETTINGS
#     {
#     "commandToExecute": "sudo apt-get update && sudo apt-get install nginx"
#     }
#     SETTINGS

# }