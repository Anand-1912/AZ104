// Concept of parameters
// https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/parameters

// We can give a default value to the parameter
// We can also use decorators to add metadata or constraints
// To deploy with a parameter
// New-AzResourceGroupDeployment -ResourceGroupName app-grp -TemplateFile main07.bicep -location "East US"

@description('Please specify a location for the resource')
param location string='North Europe'

var networkName='appnetwork'
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
