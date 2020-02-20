#!/bin/bash

myResoruceGroup="my-resource-group-rg"
region="canada central"

# Deploy the Empty Template
templateFile="template.json"

adminPassword="$(openssl rand -base64 32)"

# Create the resoruce group and resoruces for DEV
az group create \
  --name $myResoruceGroup \
  --location "$region"

az group deployment create \
  --handle-extended-json-format \
  --name deploymentorder  \
  --resource-group $myResoruceGroup \
  --template-file $templateFile \
  --parameters adminUsername=adminuser adminPassword=$adminPassword dnsLabelPrefix=makolo

# Verify the deployment in the portal
# Az docs - https://docs.microsoft.com/en-us/cli/azure/group/deployment?view=azure-cli-latest

az group deployment --help
az group deployment create --help

# Clean up resoruces group
az group delete \
  --handle-extended-json-format \
  --resource-group $myResoruceGroup \
  --yes