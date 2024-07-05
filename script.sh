mvn clean package azure-functions:package

#Initializes a Terraform working directory, including downloading providers and modules.
terraform init
terraform validate
terraform fmt
terraform apply

 az functionapp deployment source config-zip -g m365 -n m365-functions --src m365.zip

