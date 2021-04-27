# Provisioning

Using https://github.com/Azure/bicep with VSCode extension https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-bicep

## main.bicep

Creating the resources in an already pre-existing resource group:

```
az deployment group create -f ./main.bicep -g rg-ghaction-cwi-tests --parameters environment=prod
```

Tested with Azure CLI 2.22.1