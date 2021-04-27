# Workflows

See folder `.github\workflows`

## Helpers

* workflowdispatch-with-permissions.yml: limit who in the repo can initiate a workflow
* azurecli-latest-version.yml: simply print the az cli version

## Provisioning

* scoped-credentials-keyvault.yml: Based on https://docs.microsoft.com/en-us/azure/spring-cloud/github-actions-key-vault. Changes: Key Vault is created with RBAC only, service principal has role "Secrets User".
* provision-usingbicep.yml: above, plus provisioning Azure resources using bicep from the ./provisioning folder.