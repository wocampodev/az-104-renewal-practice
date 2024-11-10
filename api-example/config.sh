#!/bin/bash

RG=${RG}
APP=${APP}
ACR=${ACR}

# Publish
az group create --name $RG --location eastus
az acr create --name $ACR --resource-group $RG --sku standard --admin-enabled true
