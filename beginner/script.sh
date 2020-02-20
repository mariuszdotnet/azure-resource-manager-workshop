#!/bin/bash

myResoruceGroup="my-resource-group-rg"
region="canada central"

# Deploy the Empty Template
templateFile="template.json"

# Create the resoruce group and resoruces for DEV
az group create \
  --name myResourceGroupDev \
  --location "$region"

az group deployment create \
  --handle-extended-json-format \
  --name devenvironment  \
  --resource-group myResourceGroupDev \
  --template-file $templateFile \
  --parameters azuredeploy.parameters.dev.json

# Create the resoruce group and resoruces for PROD
az group create \
  --name myResourceGroupProd \
  --location "$region"

az group deployment create \
  --handle-extended-json-format \
  --name prodenvironment  \
  --resource-group myResourceGroupProd \
  --template-file $templateFile \
  --parameters azuredeploy.parameters.prod.json


# Verify the deployment in the portal
# Az docs - https://docs.microsoft.com/en-us/cli/azure/group/deployment?view=azure-cli-latest

az group deployment --help
az group deployment create --help

# Clean up resoruces group
az group delete \
  --resource-group $myResoruceGroup \
  --yes