# awesome-terraform

Basic Terraform sample definition using Azure and Azure Pipelines.
 
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
