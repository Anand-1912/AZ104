resource appstore20554344 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'appstore20554344'
  location: 'North Europe'
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    accessTier: 'Cool'
    allowBlobPublicAccess: true
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
      ipRules: [
        {
          action: 'Allow'
          value: '92.97.250.7'
        }
      ]
    }
  }
}

resource appstore20554344_default 'Microsoft.Storage/storageAccounts/blobServices@2022-05-01' = {
  parent: appstore20554344
  name: 'default'
  properties: {
    isVersioningEnabled: true
  }
}
