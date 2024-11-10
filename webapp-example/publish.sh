#!/bin/bash

RG=${RG}
APP=${APP}

# Compile
dotnet publish -o publish
cd publish

# Package
zip -r site.zip *

# Publish
az webapp deploy \
    --src-path site.zip \
    --resource-group $RG  \
    --name $APP
