#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault

data "azurerm_client_config" "current" {} #used to access the Azure RM Configuration

resource "azurerm_resource_group" "main" {
  name     = "rg-AZ104"
  location = "uksouth"
}

resource "azurerm_key_vault" "main" {
  name                        = "kvaz1912"
  location                    = azurerm_resource_group.main.location
  resource_group_name         = azurerm_resource_group.main.name
  enable_rbac_authorization = false
  enabled_for_deployment = false #used by VM to retrieve secrets
  enabled_for_template_deployment = false #used by Azure Resource Manager
  enabled_for_disk_encryption = true #used by Disk Encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id #tenant used by keyvault for AuthN
  soft_delete_retention_days  = 7 #for both Kevault and its Secrets
  purge_protection_enabled    = false #mandatory retention period before we can delete the keyvault
  #public_network_access_enabled = true
  sku_name = "standard" #premium

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}