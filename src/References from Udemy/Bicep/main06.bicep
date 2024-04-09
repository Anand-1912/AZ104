// Can we define the address prefix for the virtual network beforehand
// Concept of variables
// https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/variables
var networkName='appnetwork'
var location='North Europe'
var networkAddressPrefix='10.0.0.0/16'

resource appnetwork 'Microsoft.Network/virtualNetworks@2022-07-01' = {
  name: networkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        networkAddressPrefix
      ]
    }
    subnets: [for i in range(1, 3): {      
        name: 'Subnet${i}'
        properties: {
          addressPrefix: cidrSubnet(networkAddressPrefix, 24, i)
        }
      }]        
  }
}
