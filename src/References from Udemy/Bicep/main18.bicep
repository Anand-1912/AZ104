resource plan554434 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'plan554434'
  location: 'North Europe'
  sku: {
    name: 'F1'
    capacity: 1
  }
  properties: {    
  }
}

resource demoapp544343 'Microsoft.Web/sites@2022-03-01' = {
  name: 'demoapp544343'
  location: 'North Europe'
  properties: {    
    serverFarmId: plan554434.id
    siteConfig: {
      netFrameworkVersion: 'v6.0'                  
    }
  }
}
