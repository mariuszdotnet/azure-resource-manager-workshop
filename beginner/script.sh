#!/bin/bash

myResoruceGroup="my-resource-group-rg"
region="canada central"

# Create Empty Resoruce Group
az group create \
  --name $myResoruceGroup \
  --location "$region"

# Deploy the Empty Template
templateFile="template.json"

az group deployment create \
  --name addwebapp \
  --resource-group $myResoruceGroup \
  --template-file $templateFile \
  --parameters storagePrefix=store storageSKU=Standard_LRS webAppName=demoapp

# Verify the deployment in the portal
# Az docs - https://docs.microsoft.com/en-us/cli/azure/group/deployment?view=azure-cli-latest

az group deployment --help
az group deployment create --help

# Clean up resoruces group
az group delete \
  --resource-group $myResoruceGroup \
  --yes