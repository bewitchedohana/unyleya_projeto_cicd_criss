terraform {
  cloud {

    organization = "UnyleyaCrissTesteCICD"

    workspaces {
      name = "Unidade4UnileiaCICDC"
    }
  }
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.31.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

data "azurerm_client_config" "client_config" {}

resource "azurerm_resource_group" "resource_group" {
  name     = "uny_resource_group"
  location = "brazilsouth"
}