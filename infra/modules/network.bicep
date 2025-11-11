param location string
param env string
param vnetName string = 'vnet-bf-${env}'
param addressSpace string = '10.10.0.0/16'
param frontendSubnetPrefix string = '10.10.1.0/24'
param backendSubnetPrefix string = '10.10.2.0/24'
param dataSubnetPrefix string = '10.10.3.0/24'

resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressSpace
      ]
    }
    subnets: [
      {
        name: 'snet-frontend'
        properties: {
          addressPrefix: frontendSubnetPrefix
        }
      }
      {
        name: 'snet-backend'
        properties: {
          addressPrefix: backendSubnetPrefix
        }
      }
      {
        name: 'snet-data'
        properties: {
          addressPrefix: dataSubnetPrefix
        }
      }
    ]
  }
}

output vnetId string = vnet.id
output frontendSubnetId string = vnet.properties.subnets[0].id
output backendSubnetId string = vnet.properties.subnets[1].id
output dataSubnetId string = vnet.properties.subnets[2].id
