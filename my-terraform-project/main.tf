terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 5.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "test-mate-terraform"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "matestorage"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}