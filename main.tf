terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "ntms" {
name = var.rgname
location = var.location
}

resource "azurerm_virtual_network" "ntms" {
name = var.vnet
location = var.location
resource_group_name = var.rgname
address_space = ["10.1.0.0/16"]
} 

resource "azurerm_subnet" "subnet1" {
name = "subnet1"
resource_group_name = var.rgname
virtual_network_name = var.vnet
address_prefixes = ["10.1.1.0/24"]
}