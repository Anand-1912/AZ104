// Make sure your virtual network and public IP address is deployed

param resourceLocation string ='North Europe'

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
            // resourceId - Gets a resource Id for an existing resource
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', 'appnetwork', 'SubnetA')
          }
          publicIPAddress: {
            id: resourceId('Microsoft.Network/publicIPAddresses', 'app-ip')
          }
        }
      }
    ]
  }
}
