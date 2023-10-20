terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfsto"
    storage_account_name = "stotf00651"
    container_name       = "terraform"
    key                  = "cE3IpEYXviZk9QV7S3SkNgHC9Y9lBqIDHTeD0cOUa6e40K0q7Cm/xOIPsgDtRFysdIuwV7X5yvxZ+ASttkCOMA=="
  }
}

provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "rg-state" {
  name     = "rg-remote-state"
  location = "brazilsouth"
}