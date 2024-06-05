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

resource "azuredevops_project" "project" {
  name               = var.project_name
  visibility         = var.visibility
  version_control    = var.version_control
  work_item_template = var.work_item_template
}
