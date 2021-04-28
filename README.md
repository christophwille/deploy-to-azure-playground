# Workflows

See folder `.github\workflows`

## Helpers

* workflowdispatch-with-permissions.yml: limit who in the repo can initiate a workflow
* azurecli-latest-version.yml: simply print the az cli version

## Provisioning

* scoped-credentials-keyvault.yml: See [Service Principal credentials in Key Vault](secrets-in-keyvault.md)
* provision-usingbicep.yml: above, plus provisioning Azure resources using bicep from the ./provisioning folder.

## Deployment (CI/CD)

* simple-build.yml: mixed Functions and Web app build for .NET Core 3.1 and .NET 5.
* simple-cicd.yml: publish artifacts and immediately deploy to known stage (Function & Web App).
* test-stage-cicd.yml: See [Deploying to Stages](deploying-to-stages.md)