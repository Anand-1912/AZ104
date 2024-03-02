
# Lifecycle management offers a rich, rule-based policy for general purpose v2 and blob storage accounts. Use the policy to transition your data to the appropriate access tiers or expire at the end of the data's lifecycle. 
# A new or updated policy may take up to 48 hours to complete

resource "azurerm_storage_management_policy" "example" {
  storage_account_id = azurerm_storage_account.main.id

  rule {
    name    = "Rule-001"
    enabled = true
    filters {
      blob_types = ["blockBlob"] #blockBlob, appendBlob
      #prefix_match = ["container2/prefix1", "container2/prefix2"]
    }
    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than    = 10
        tier_to_archive_after_days_since_modification_greater_than = 50
        delete_after_days_since_modification_greater_than          = 100
      }
      #   snapshot {
      #     change_tier_to_archive_after_days_since_creation = 90
      #     change_tier_to_cool_after_days_since_creation    = 23
      #     delete_after_days_since_creation_greater_than    = 31
      #   }
      #   version {
      #     change_tier_to_archive_after_days_since_creation = 9
      #     change_tier_to_cool_after_days_since_creation    = 90
      #     delete_after_days_since_creation                 = 3
      #   }
    }
  }
}
