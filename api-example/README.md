# API Example

## Tools

- NodeJS 22
- pnpm
- Podman
- Azure CLI

## Build and Deploy

Configure resource group name and app name in environment variables

```bash
export RG=az104-api-example-rg
export ACR=az104apiexampleacr
export APP=api-example
```

Launch build and publish to Azure

```bash
./config.sh # Create ACR and RG
./publish.sh # Create image and publish on ACR
./deploy.sh # Deploy container to ACI
```
