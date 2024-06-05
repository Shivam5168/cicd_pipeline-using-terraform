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

resource "azuredevops_serviceendpoint_dockerregistry" "example" {
  project_id            = var.name
  service_endpoint_name = "shivamDockerHub"
  docker_username       = "shivam20022003"
  docker_email          = "shivampradhan25m@gmail.com"
  docker_password       = "Mahi@6299348462"
  registry_type         = "DockerHub"
}