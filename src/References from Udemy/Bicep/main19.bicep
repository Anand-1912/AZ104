// VM with availability set

param resourceLocation string ='North Europe'
@secure()
param adminPassword string

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
    ]    }
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
    networkSecurityGroup: {
      id: app_nsg.id
    }
  }
}


resource vmstore55434434 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'vmstore55434434'
  location: resourceLocation
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

resource app_nsg 'Microsoft.Network/networkSecurityGroups@2022-07-01' = {
  name: 'app-nsg'
  location: resourceLocation
  properties: {
    securityRules: [
      {
        name: 'Allow-RDP'
        properties: {
          description: 'Allow Remote Desktop'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 110
          direction: 'Inbound'
        }
      }
      {
        name: 'Allow-HTTP'
        properties: {
          description: 'Allow HTTP'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '80'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 120
          direction: 'Inbound'
        }
      }
    ]
  }
}

resource appvmconfigapp 'Microsoft.Compute/virtualMachines/extensions@2022-11-01' = {
  parent: appvm
  name: 'appvmconfigapp'
  location: 'North Europe'
  properties: {
    publisher: 'Microsoft.Compute'
    type: 'CustomScriptExtension'
    typeHandlerVersion: '1.10'
    autoUpgradeMinorVersion: true
    settings: {
      fileUris: [
        'https://appstore4434343.blob.core.windows.net/scripts/setup1.ps1?sv=2022-11-02&ss=b&srt=sco&sp=rl&se=2023-07-12T13:17:32Z&st=2023-07-12T05:17:32Z&spr=https&sig=yu7gVQgUr97VxXNU7Qaq4hG%2BvJKHvlxEw69g0kC1Pxc%3D'
      ]
    }
    protectedSettings: {
      commandToExecute: 'powershell -ExecutionPolicy Unrestricted -File setup1.ps1'
    }
  }
}

resource appvm 'Microsoft.Compute/virtualMachines@2022-11-01' = {
  name: 'appvm'
  location: resourceLocation
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2s_v3'
    }
    osProfile: {
      computerName: 'appvm'
      adminUsername: 'appusr'
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2022-Datacenter'
        version: 'latest'
      }
      osDisk: {
        name: 'windowsVM1OSDisk'
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }            
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: app_interface.id
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri: reference(resourceId('Microsoft.Storage/storageAccounts/', toLower('vmstore55434434'))).primaryEndpoints.blob
      }
    }
    
  }
}
