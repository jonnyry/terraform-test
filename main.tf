terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.85.0"
    }
  }

  required_version = ">= 1.6.6"
}


provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg-jr-test" {
  name     = "rg-jr-test"
  location = var.location
}

resource "azurerm_virtual_network" "vnet-jr-test" {
  name                = "vnet-jr-test"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-jr-test.name
}

resource "azurerm_virtual_network" "vnet-jr-test-2" {
  name                = "vnet-jr-test-2"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-jr-test.name
}
