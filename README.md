# awesome-terraform

Basic Terraform sample definition using Azure and Azure Pipelines.

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
 
## Resources

- Resource Group
- Virtual Network
  - Subnet / Service Endpoint / Delegation
- App Service Plan
- Web App
  - Regional VNET Integration
- Application Insights

## Pipelines

- `.azure`
  - `templates`
    - `terraform-init.yml`
  - `pipelines-dev.yml`
    - for develop env
  - `pipelines-prd.yml`
    - for production env
