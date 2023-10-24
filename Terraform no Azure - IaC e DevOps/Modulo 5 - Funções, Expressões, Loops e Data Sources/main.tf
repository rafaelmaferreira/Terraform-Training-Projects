provider "azurerm" {
  features {
  }
}


resource "azurerm_resource_group" "grupo-recurso" {
  count    = 2
  location = "brazilsouth"
  name     = "rg-mod05-${count.index}"
  tags = {
    data        = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp()),
    ambiente    = lower("HomoLogacao")
    responsavel = upper("rafael ferreira")
    tecval      = title("terraform")
  }
}

variable "vnetips" {
  type    = list(any)
  default = ["10.0.0.0/16"]

}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-terraform"
  location            = "brazilsouth"
  resource_group_name = "rg-mod05-1"
  address_space       = length(var.vnetips) == 0 ? ["10.0.0.0/16", "192.168.0.0/16"] : var.vnetips
}
output "vnet-numeroips" {
  value = length("${azurerm_virtual_network.vnet.address_space}")
}