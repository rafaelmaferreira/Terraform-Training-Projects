provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-aci"
  location = "brazilsouth"
}

resource "azurerm_container_group" "aci" {
  name                = "example-continst"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_address_type = "Public"
  dns_name_label  = "aci-sitetreinamentotf"
  os_type         = "Linux"

  image_registry_credential {
    username = "containerregistrytf890"
    password = "ak1FknKbT49usl1q7Y8a7dgNuJak8v60cyEfwf8WwL+ACRB9vPck"
    server   = "containerregistrytf890.azurecr.io"
  }

  container {
    name   = "aciregistrytf"
    image  = "containerregistrytf890.azurecr.io/containersnoazure:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 443
      protocol = "TCP"
    }

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}
