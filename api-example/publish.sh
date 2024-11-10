#!/bin/bash

RG=${RG}
APP=${APP}
ACR=${ACR}

# Build
podman build -t "wocampodev/$APP" .
podman tag $APP "$ACR.azurecr.io/$APP:latest"

# Publish
USER=$(az acr credential show --name $ACR --resource-group $RG --query "username" -o tsv)
PASS=$(az acr credential show --name $ACR --resource-group $RG --query "passwords[0].value" -o tsv)

podman login "$ACR.azurecr.io" --username $USER --password $PASS
podman push "$ACR.azurecr.io/$APP:latest"
