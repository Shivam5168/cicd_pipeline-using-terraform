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

resource "azurerm_key_vault_secret" "example" {
  name         = var.secret_name
  value        = var.secret_value 
  key_vault_id = var.key_vault_id
}
