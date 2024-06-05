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

resource "azuredevops_build_definition" "azuredevops_build" {
  project_id = var.project_id
  name       = var.name

  ci_trigger {
    use_yaml = var.use_yaml
  }

  repository {
    repo_type             = var.repo_type
    repo_id               = var.repo_id
    branch_name           = var.branch_name
    yml_path              = var.yml_path
    service_connection_id = var.github_id
  }

  schedules {
    branch_filter {
      include = var.include
      exclude = var.exclude
    }
    days_to_build              = var.days_to_build
  }
}