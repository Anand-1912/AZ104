resource appnetwork 'Microsoft.Network/virtualNetworks@2022-07-01' = {
  name: 'appnetwork'
  location: 'North Europe'
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
        name: 'AzureBastionSubnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

resource bastion_ip 'Microsoft.Network/publicIPAddresses@2022-07-01' = {
  name: 'bastion-ip'
  location: 'North Europe'
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource app_bastion 'Microsoft.Network/bastionHosts@2020-07-01' = {
  name: 'app-bastion'
  location: 'North Europe'
  properties: {
    ipConfigurations: [
      {
        name: 'bastion-config'
        properties: {
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', 'appnetwork', 'AzureBastionSubnet')
          }
          publicIPAddress: {
            id: bastion_ip.id
          }
        }
      }
    ]
  }  
}
