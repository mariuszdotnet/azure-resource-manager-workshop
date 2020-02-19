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
  --parameters storageName=storageaccount1mk

# Verify the deployment in the portal
# Az docs - https://docs.microsoft.com/en-us/cli/azure/group/deployment?view=azure-cli-latest

az group deployment --help
az group deployment create --help

# Clean up resoruces group
az group delete \
  --resource-group $myResoruceGroup \
  --yes