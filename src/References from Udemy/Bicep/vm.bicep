// Putting the resource of the storage account because it is referenced 
// when creating the VM

param resourceLocation string ='North Europe'
@secure()
param adminPassword string

resource vmstore55434434 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'vmstore55434434'
  location: resourceLocation
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
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
          id: resourceId('Microsoft.Network/networkInterfaces', 'app-interface')
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
