# m365-gateway

https://github.com/Azure/functions-action?tab=readme-ov-file
az ad sp create-for-rbac --name "myApp" --role contributor \
--scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group}/providers/Microsoft.Web/sites/{app-name} \
--sdk-auth

Replace {subscription-id}, {resource-group}, and {app-name} with the names of your subscription, resource group, and Azure function app.

The command should output a JSON object similar to this:

/subscription id =3f366596-10fd-45c7-8882-a45e78b598b4

az ad sp create-for-rbac --name m365-java-functions --role contributor --scopes
/subscriptions/3f366596-10fd-45c7-8882-a45e78b598b4/resourceGroups/m365-gateway
/providers/Microsoft.Web/sites/m365-java-functions --sdk-auth

{
"appId": "fe4d279b-3296-4364-addf-4935c5b09bc6",
"displayName": "myApp",
"password": "~c18Q~iDiIYD_Yb4GsqxmfuT0vUjRpTtVMcmlc~T",
"tenant": "b1219c7d-011e-406f-9f20-2ae04585450e"
}

If you are running this in a CI/CD pipeline, you will need to authenticate using a service principal. You can create a
service principal and assign it the necessary permissions in Azure, then set the ARM_CLIENT_ID, ARM_CLIENT_SECRET,
ARM_SUBSCRIPTION_ID, and ARM_TENANT_ID environment variables in your pipeline to the corresponding values of your
service principal.

env:
ARM_CLIENT_ID: "fe4d279b-3296-4364-addf-4935c5b09bc6"
ARM_CLIENT_SECRET="~c18Q~iDiIYD_Yb4GsqxmfuT0vUjRpTtVMcmlc~T"
ARM_SUBSCRIPTION_ID="3f366596-10fd-45c7-8882-a45e78b598b4"
ARM_TENANT_ID: "b1219c7d-011e-406f-9f20-2ae04585450e"

az ad sp create-for-rbac --name "myApp" --role contributor --scopes
/subscriptions/3f366596-10fd-45c7-8882-a45e78b598b4/resourceGroups/m365-gateway --json-auth

https://github.com/hashicorp/terraform-provider-azurerm/tree/main/examples/virtual-networks

Terraform Important files:
The _terraform.lock.hcl_ file should be stored in
the same directory as your Terraform configuration files
(.tf files). This file is automatically created and updated by Terraform when you run terraform init. It's used to
ensure
that the same provider versions are used across all machines.  
This file should be committed to your version control system (like Git)
to ensure that all team members and your deployment systems use the same provider versions.
This helps to avoid inconsistencies that could occur if different versions of providers are used.

The _terraform.tfstate_ file should be stored in a remote location.
Terraform supports storing state in a remote backend, such as Azure Storage.
Remote storage provides benefits like state locking, consistency checking, and team collaboration.
The state file contains sensitive information, so it should be stored securely.

# Infrastructure as a Code (IaC)

Infrastructure as code (IaC) is the process of managing and provisioning computer data centers through machine-readable
definition files,
rather than physical hardware configuration or interactive configuration tools.

## Implementation

Version file: specify the required version of Terraform and provider plugins.
The required providers block specifies the provider required for the configuration.
In our case, the Azure Resource Manager provider is required. The version block specifies the required version of the
provider.

SKU = Stock Keeping Unit
In the context of the log Analytics workplace, the SKU is the pricing tier of the workplace.
The "PerGB2018" SKU is the default pricing tier for the workspace - the pricing tier charges based on the amount of data
ingested into the workspace and the data retention configuration.


Github Actions to deploy to Azure
https://github.com/Azure/actions-workflow-samples/tree/master


>>
> https://learn.microsoft.com/en-us/azure/azure-functions/functions-how-to-github-actions?tabs=windows%2Cdotnet&pivots=method-template

