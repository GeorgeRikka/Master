## Version setting block
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  client_id       = "d2693b34-37ce-4199-b5fd-658e3d108672"
  client_secret   = var.client_secret
  tenant_id       = "a49fc0a7-261e-4a4c-a0e8-f630a651af2a"
  subscription_id = "cbdd429a-5f79-42b9-8e27-911f0a0e6599"
}
