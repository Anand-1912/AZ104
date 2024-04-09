// We want to create the virtual network using the CIDR function
// https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/bicep-functions-cidr

resource appnetwork 'Microsoft.Network/virtualNetworks@2022-07-01' = {
  name: 'appnetwork'
  location: 'North Europe'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [for i in range(1, 3): {      
        name: 'Subnet${i}'
        properties: {
          addressPrefix: cidrSubnet('10.0.0.0/16', 24, i)
        }
      }]        
  }
}
