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
name = "ayushicloud-RG"
location = "eastus"
}

resource "azurerm_virtual_network" "ntms" {
name = "vnet1"
location = azurerm_resource_group.ntms.location
resource_group_name = azurerm_resource_group.ntms.name 
address_space = ["10.1.0.0/16"]
} 

resource "azurerm_subnet" "subnet1" {
name = "subnet1"
resource_group_name = azurerm_resource_group.ntms.name
virtual_network_name = azurerm_virtual_network.ntms.name
address_prefixes = ["10.1.1.0/24"]
}