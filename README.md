# awesome-terraform

Basic Terraform sample definition using Azure and Azure Pipelines / GitHub Actions.

## File structure

- `envs`
  - `dev`
    - `main.tf`
  - `prd`
    - `main.tf`
- `modules`
  - `appInsights.tf`
  - `appService.tf`
  - `appServicePlan.tf`
  - `resourceGroup.tf`
  - `virtualNetwork.tf`
    - Azure Resouces definition
  - `variables.tf`
    - Define module variables
 
## Azure Resources

- Resource Group
- Virtual Network
  - Subnet / Service Endpoint / Delegation
- App Service Plan
- Web App
  - Regional VNET Integration
- Application Insights

## Azure Pipelines / GitHub Actions

- `.azure-pipelines`
  - `templates`
    - `run-terraform.yml`
  - `development.yml`
    - for develop env
  - `production.yml`
    - for production env
- `.github/workflows`
  - `development.yml`
    - for develop env
  - `production.yml`
    - for production env