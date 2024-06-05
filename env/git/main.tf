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

resource "azuredevops_serviceendpoint_github" "github" {
  project_id            = var.project_id
  service_endpoint_name = var.service_endpoint_name

  auth_personal {
    personal_access_token = var.pat
  }
}
