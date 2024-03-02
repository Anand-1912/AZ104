resource "azurerm_storage_account" "main" {

  name                = "staz10402032024"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  account_tier             = "Standard"  #Standard, Premium
  account_kind             = "StorageV2" #BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2
  account_replication_type = "LRS"       #LRS,ZRS,GRS,GZRS,RAGRS,RAGZRS
  access_tier              = "Hot"       #Hot, Cool

  enable_https_traffic_only       = true
  allow_nested_items_to_be_public = true
  shared_access_key_enabled       = true

  blob_properties {
    change_feed_enabled = true
    versioning_enabled  = true
  }

  tags = {
    course = "az104"
  }
}