#!/bin/bash
RESOURCE_GROUP_NAME=tfstatepoc
STORAGE_ACCOUNT_NAME_PROD=tfstateprod1213
STORAGE_ACCOUNT_NAME_PROD=tfstatedev1213
CONTAINER_NAME_PROD=tfstateprod
CONTAINER_NAME_DEV=tfstatedev
# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location centralindia
# Create storage account prod
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME_PROD --sku Standard_LRS --encryption-services blob
# Create blob container prod
az storage container create --name $CONTAINER_NAME_PROD --account-name $STORAGE_ACCOUNT_NAME_PROD
# Create storage account dev
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME_DEV --sku Standard_LRS --encryption-services blob
# Create blob container dev
az storage container create --name $CONTAINER_NAME_DEV --account-name $STORAGE_ACCOUNT_NAME_DEV
