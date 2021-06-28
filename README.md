# awesome-terraform

Basic Terraform sample definition using Azure and Azure Pipelines / GitHub Actions.

## File structure

- `envs`
  - `dev`
    - `main.tf`
  - `prd`
    - `main.tf`
- `modules`
  - `common`
    - Common Azure resources definition
  - `functionapp`
    - Azure Function resources definition
  - `webapp`
    - Web App resources definition
 
## Azure Resources

- Common
  - Resource Group
  - Virtual Network
    - Subnet / Service Endpoint / Delegation
  - Cosmos DB Account
    - Virtual Network Rule
- Web App
  - App Service Plan
  - Application Insights
  - Regional VNET Integration
- Azure Functions
  - App Service Plan
  - Application Insights
  - Regional VNET Integration

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