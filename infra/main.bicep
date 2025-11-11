param location string = resourceGroup().location

@allowed([
  'staging'
  'prod'
])
param env string = 'staging'

var appName = 'bf-${env}'
var logAnalyticsName = 'log-${appName}'
var appInsightsName = 'appi-${appName}'

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
