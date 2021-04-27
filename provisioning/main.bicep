param environment string = 'dev'

param functionName string = 'cwighfunc${environment}'
param appserviceName string = 'cwighappsvc${environment}'

module azfunc './function.bicep' = {
  name: 'AzureFunctionApp'
  params: {
    appName: functionName
  }
}

module website './appservice.bicep' = {
  name: 'AppService'
  params: {
    appName: appserviceName
  }
}
