provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-vnet"
  location = "brazilsouth"
  tags = {
    "ambiente" = "treinamento"
  }

}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-tf"
  location            = "brazilsouth"
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16", "192.168.0.0/16"]
  tags = {
    "ambiente" = "testes"
  }

}

resource "azurerm_network_security_group" "nsg" {
  
}