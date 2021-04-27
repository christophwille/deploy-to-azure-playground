@maxLength(30)
param appName string
param location string = resourceGroup().location

param appServicePlanTier string = 'B1'
param appServicePlanInstances int = 1

var hostingPlanName = '${appName}${uniqueString(resourceGroup().id)}'

resource farm 'Microsoft.Web/serverFarms@2020-06-01' = {
  name: hostingPlanName
  location: location
  sku: {
    name: appServicePlanTier
    capacity: appServicePlanInstances
  }
  properties: {}
}

resource website 'Microsoft.Web/sites@2020-06-01' = {
  name: appName
  location: location
  identity:{
    type:'SystemAssigned'
  }
  properties: {
    serverFarmId: farm.id
    siteConfig: {
      use32BitWorkerProcess: false
      http20Enabled: true
      minTlsVersion: '1.2'
      ftpsState: 'Disabled'
      netFrameworkVersion: 'v5.0'
    }
  }
}
