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
  --name addnameparameter \
  --resource-group $myResoruceGroup \
  --template-file $templateFile \
  --parameters storageName=storageaccount2mk

# Deploy the second template with SKU parameter default
templateFile="template-two.json"

az group deployment create \
  --name addskuparameter \
  --resource-group $myResoruceGroup \
  --template-file $templateFile \
  --parameters storageName=storageaccount2mk

# Deploy the second template with SKU parameter updated SKU to GRS
az group deployment create \
  --name addskuparameter \
  --resource-group $myResoruceGroup \
  --template-file $templateFile \
  --parameters storageSKU=Standard_GRS storageName=storageaccount2mk

# Verify the deployment in the portal
# Az docs - https://docs.microsoft.com/en-us/cli/azure/group/deployment?view=azure-cli-latest

az group deployment --help
az group deployment create --help

# Clean up resoruces group
az group delete \
  --resource-group $myResoruceGroup \
  --yes