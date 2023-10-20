provider "azurerm" {
  features {
  }
}


resource "azurerm_resource_group" "grupo-recurso" {
  name     = var.name-rg
  location = var.location
  tags = merge(var.tags, {
  treinamento = "terraform" })
}

resource "azurerm_virtual_network" "vnet" {
  depends_on          = [azurerm_resource_group.grupo-recurso]
  name                = "vnet-terraform"
  resource_group_name = azurerm_resource_group.grupo-recurso.name
  location            = var.location
  address_space       = var.vnetenderecos

}
