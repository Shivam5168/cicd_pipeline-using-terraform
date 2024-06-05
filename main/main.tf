terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 0.4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# module "resource_group" {
#   source = "../resource/resource_group"
#   resource_group_name = "shivampipeline"
#     location = "East US"
# }

data "azurerm_resource_group" "resource_group" {
  name = "shivampipeline"
}

module "key_vault" {
  source = "../resource/key_vault"
  name = "pipelineSecretvalue"
}

module "key_vault_secret"{
  source = "../resource/secret"
  secret_name = "organisationURL"
  secret_value = "https://dev.azure.com/rallanraghav/"
  key_vault_id = module.key_vault.key_vault_output
}

data "azurerm_key_vault_secret" "organisationURL" {
  name         = "organisationURL"
  key_vault_id = module.key_vault.key_vault_output
}

data "azurerm_key_vault_secret" "organisationPAT" {
  name         = "organisationPAT"
  key_vault_id = module.key_vault.key_vault_output
}

data "azurerm_key_vault_secret" "GitToken"{
  name = "GitToken"
  key_vault_id = module.key_vault.key_vault_output
}

provider "azuredevops" {
  org_service_url       = data.azurerm_key_vault_secret.organisationURL.value
  personal_access_token = data.azurerm_key_vault_secret.organisationPAT.value
}


module "project" {
  source             = "../resource/project"
  project_name       = "cicd_pipeline_shivam_project"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
}

module "github_setup" {
  source = "../env/git"
  project_id = module.project.project_id_output
  service_endpoint_name = "cicd-pipeline"
  pat = data.azurerm_key_vault_secret.GitToken.value
}

module "pipeline" {
  source = "../resource/piepline"
  project_id = module.project.project_id_output
  name = "azure_pipeline"
  use_yaml = true
  repo_type = "GitHub"
  repo_id = "Shivam5168/React"
  branch_name = "master"
  yml_path = "cicd_pipeline.yml"
  github_id = module.github_setup.github_id_output
  days_to_build = ["Wed", "Sun"]
  include = ["master"]
  exclude = ["test", "regression"]
  
}

module "web_app" {
  source = "../resource/web_app"
  name = "shivam00121"
  resource_group_name = data.azurerm_resource_group.resource_group.name
  location = "eastus2"
}