terraform {
  //backend "azurerm" { }
}
provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-acr"
  location = "brazilsouth"
}

resource "azurerm_container_registry" "acr" {
  name                = "containerregistrytf890"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Premium"
  admin_enabled       = true
}

output "admin-usuario" {
  value = azurerm_container_registry.acr.admin_username
}

output "url" {
  value = azurerm_container_registry.acr.login_server
}

output "admin-senha" {
  value     = azurerm_container_registry.acr.admin_password
  sensitive = true
}
