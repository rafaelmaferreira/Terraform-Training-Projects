terraform {
  backend "azurerm" {
    resource_group_name  = "storagerg"
    storage_account_name = "tftreinamento3xo"
    container_name       = "terraform"
    key                  = "alYijUjI+/TaxJ3R7SIGiueuyNNyXr2d8HiSMSNJoj62mHLhs05l/8XjV/W3qM760aEkgZI9tqux+AStoPmX5g=="
  }
}

provider "azurerm" {
  features {
  }
}

variable "location" {
  type = string
  default = "brazilsouth"

}

resource "azurerm_resource_group" "rg" {
  name     = "rg-appservice${lower(terraform.workspace)}"
  location = var.location
}


resource "azurerm_service_plan" "plan" {
  name                = "appserviceplan0354${lower(terraform.workspace)}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "appservice" {
  name                = "tfappservicemod0545${lower(terraform.workspace)}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.plan.id
  site_config {
  }
  app_settings = {
    "chave" = "123456"
  }
}