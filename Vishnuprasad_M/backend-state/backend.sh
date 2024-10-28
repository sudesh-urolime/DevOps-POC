#!/bin/bash

RESOURCE_GROUP_NAME=tfstatepoc
STORAGE_ACCOUNT_NAME_PROD=tfstateprod1213
STORAGE_ACCOUNT_NAME_DEV=tfstatedev1213
CONTAINER_NAME_PROD=tfstateprod
CONTAINER_NAME_DEV=tfstatedev

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location centralindia

# Create storage account for prod
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME_PROD --sku Standard_LRS --encryption-services blob

# Get storage account key for prod
ACCOUNT_KEY_PROD=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME_PROD --query '[0].value' --output tsv)

# Create blob container for prod
az storage container create --name $CONTAINER_NAME_PROD --account-name $STORAGE_ACCOUNT_NAME_PROD --account-key $ACCOUNT_KEY_PROD

# Create storage account for dev
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME_DEV --sku Standard_LRS --encryption-services blob

# Get storage account key for dev
ACCOUNT_KEY_DEV=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME_DEV --query '[0].value' --output tsv)

# Create blob container for dev
az storage container create --name $CONTAINER_NAME_DEV --account-name $STORAGE_ACCOUNT_NAME_DEV --account-key $ACCOUNT_KEY_DEV

