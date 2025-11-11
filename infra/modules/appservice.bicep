param location string
param env string
param appName string
@description('App Service SKU name (e.g. P1v3, S1, B1).')
param skuName string = 'P1v3'
@description('App Service SKU tier (e.g. PremiumV3, Standard, Basic).')
param skuTier string = 'PremiumV3'

var planName = 'asp-${appName}-${env}'
var apiAppName = 'api-${appName}-${env}'

resource plan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: planName
  location: location
  sku: {
    name: skuName
    tier: skuTier
    capacity: 1
  }
}

resource apiApp 'Microsoft.Web/sites@2022-03-01' = {
  name: apiAppName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    httpsOnly: true
    serverFarmId: plan.id
  }
}

output apiName string = apiApp.name
output planId string = plan.id
