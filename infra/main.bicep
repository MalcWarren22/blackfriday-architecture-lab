param location string = resourceGroup().location

@allowed([
  'staging'
  'prod'
])
param env string = 'staging'

var appName = 'bf-${env}'
var logAnalyticsName = 'log-${appName}'
var appInsightsName = 'appi-${appName}'
var planName = 'asp-${appName}'
var apiAppName = 'api-${appName}'

resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  location: location
  properties: {
    retentionInDays: 30
  }
  tags: {
    env: env
    app: 'blackfriday-architecture-lab'
  }
}

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalytics.id
  }
  tags: {
    env: env
    app: 'blackfriday-architecture-lab'
  }
}

resource plan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: planName
  location: location
  sku: {
    name: 'B1'
    tier: 'Basic'
    size: 'B1'
    capacity: 1
  }
  tags: {
    env: env
    app: 'blackfriday-architecture-lab'
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
    siteConfig: {
      appSettings: [
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: appInsights.properties.InstrumentationKey
        }
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: appInsights.properties.ConnectionString
        }
      ]
    }
  }
  tags: {
    env: env
    app: 'blackfriday-architecture-lab'
    role: 'api'
  }
}
