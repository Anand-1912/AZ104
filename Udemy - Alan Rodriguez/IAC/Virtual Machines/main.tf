
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

// Resource Block and the configuration of the resources
resource "azurerm_resource_group" "rg_az104" {
  name     = "rgAZ104"
  location = "Uk South"
}