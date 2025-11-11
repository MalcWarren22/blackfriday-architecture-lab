param location string
param env string
param appName string = 'bf'

var namePrefix = '${appName}-${env}'
var logAnalyticsName = 'log-${namePrefix}'
var appInsightsName = 'appi-${namePrefix}'

resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  location: location
  properties: {
    retentionInDays: 30
  }
  tags: {
    env: env
    app: appName
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
    app: appName
  }
}

output logWorkspaceId string = logAnalytics.id
output appInsightsNameOut string = appInsights.name
