#Azure Functions - PowerShell Implementation

Reference:
https://learn.microsoft.com/en-us/azure/azure-functions/create-first-function-cli-powershell?tabs=macos%2Cazure-cli%2Cbrowser

func new --name HealthCheckPowerShell --template "HTTP trigger" --authlevel "anonymous"


How to run the Azure function locally:
1. Install the .NET SDK 
2. https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-6.0.32-macos-arm64-installer
3. Install the Azure CLI
4. Install the Azure Functions Core Tools
5. Run the function locally using the following command:
 func start
