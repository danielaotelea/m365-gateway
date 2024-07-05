# m365-gateway

#https://github.com/Azure/functions-action?tab=readme-ov-file
az ad sp create-for-rbac --name "myApp" --role contributor \
                            --scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group}/providers/Microsoft.Web/sites/{app-name} \
                            --sdk-auth

# Replace {subscription-id}, {resource-group}, and {app-name} with the names of your subscription, resource group, and Azure function app.
# The command should output a JSON object similar to this:

/subscription id =3f366596-10fd-45c7-8882-a45e78b598b4

az ad sp create-for-rbac --name m365-functions --role contributor --scopes /subscriptions/3f366596-10fd-45c7-8882-a45e78b598b4/resourceGroups/m365-gateway
/providers/Microsoft.Web/sites/m365-functions --sdk-auth

{
  "appId": "fe4d279b-3296-4364-addf-4935c5b09bc6",
  "displayName": "myApp",
  "password": "~c18Q~iDiIYD_Yb4GsqxmfuT0vUjRpTtVMcmlc~T",
  "tenant": "b1219c7d-011e-406f-9f20-2ae04585450e"
}

If you are running this in a CI/CD pipeline, you will need to authenticate using a service principal. You can create a service principal and assign it the necessary permissions in Azure, then set the ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_SUBSCRIPTION_ID, and ARM_TENANT_ID environment variables in your pipeline to the corresponding values of your service principal.

env:
ARM_CLIENT_ID: ${{ secrets.ARM_CLIENT_ID }}
ARM_CLIENT_SECRET="~c18Q~iDiIYD_Yb4GsqxmfuT0vUjRpTtVMcmlc~T"
ARM_SUBSCRIPTION_ID="3f366596-10fd-45c7-8882-a45e78b598b4"
ARM_TENANT_ID: "b1219c7d-011e-406f-9f20-2ae04585450e"
