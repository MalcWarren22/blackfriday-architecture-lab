param location string
@description('Name for the critical action group.')
param actionGroupName string = 'ag-bf-critical'

resource actionGroup 'microsoft.insights/actionGroups@2023-01-01-preview' = {
  name: actionGroupName
  location: 'global'
  properties: {
    enabled: true
    groupShortName: 'bfcrit'
    emailReceivers: []
    webhookReceivers: []
  }
}

// Placeholder metric alert to be wired to real scopes later.
resource serverErrorAlert 'microsoft.insights/metricAlerts@2018-03-01' = {
  name: 'alert-bf-5xx-rate'
  location: 'global'
  properties: {
    description: 'High 5xx rate on Black Friday lab.'
    severity: 2
    enabled: false
    scopes: [] // to be populated in real environment
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: []
    }
    actions: [
      {
        actionGroupId: actionGroup.id
      }
    ]
  }
}
