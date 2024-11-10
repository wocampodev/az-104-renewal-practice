#!/bin/bash

RG=${RG}
APP=${APP}
ACR=${ACR}

USER=$(az acr credential show --name $ACR --resource-group $RG --query "username" -o tsv)
PASS=$(az acr credential show --name $ACR --resource-group $RG --query "passwords[0].value" -o tsv)

az container create \
    --resource-group $RG \
    --name $APP \
    --image "$ACR.azurecr.io/$APP:latest" \
    --dns-name-label "$APP-dns" \
    --ports 80 3000 \
    --registry-username $USER \
    --registry-password $PASS

DOMAIN=$(az container show --resource-group $RG --name $APP --query ipAddress.fqdn)

echo "DOMAIN to test: http://$DOMAIN:3000/"
