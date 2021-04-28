# Service Principal Credentials in Key Vault

Based on https://docs.microsoft.com/en-us/azure/spring-cloud/github-actions-key-vault

## Why?

Storing a high-privileged service principal in GH is a bad idea.

## My Changes

Key Vault is created with RBAC only, service principal accessing Key Vault ("strong box" in the Spring docs) has role "Secrets User" only.

Also, based on https://docs.microsoft.com/en-us/cli/azure/ad/sp?view=azure-cli-latest#az_ad_sp_create_for_rbac the
full-scope credential is not really full scope, docs quote:

```
--scopes

Space-separated list of scopes the service principal's role assignment applies to. Defaults to the root of the current subscription. e.g., /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM.”
```

Thus, this command now is limited to the resource groups where I actually want to provision and deploy to:

```
az ad sp create-for-rbac -n "ghactionspn" --role Contributor --scopes /subscriptions/{SubID}/resourceGroups/{ResourceGroup1} /subscriptions/{SubID}/resourceGroups/{ResourceGroup2} --sdk-auth
```

That way only bad things can happen to the resource groups for my stages, not the entire subscription.