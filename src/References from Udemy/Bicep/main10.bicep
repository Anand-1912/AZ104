// Deploying multiple resources

param resourceLocation string ='North Europe'
resource appnetwork 'Microsoft.Network/virtualNetworks@2022-07-01' = {
  name: 'appnetwork'
  location: resourceLocation
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'SubnetA'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'SubnetB'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

resource app_ip 'Microsoft.Network/publicIPAddresses@2022-07-01' = {
  name: 'app-ip'
  location: resourceLocation
  sku: {
    name: 'Basic'
  }
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
}

resource app_interface 'Microsoft.Network/networkInterfaces@2022-07-01' = {
  name: 'app-interface'
  location: resourceLocation
  properties: {
    ipConfigurations: [
      {
        name: 'ipConfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {            
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', 'appnetwork', 'SubnetA')
          }
          publicIPAddress: {
            id: app_ip.id
          }
        }
      }
    ]
  }
}
