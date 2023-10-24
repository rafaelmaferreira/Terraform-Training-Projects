provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-sqldatabase"
  location = "brazilsouth"
}

resource "azurerm_mssql_server" "sqlserver" {
  name                         = "sqlservertreinamentotf67821"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "05ti11ad10%%"
}

resource "azurerm_mssql_elasticpool" "sqlelasticpool" {
  name                = "azsqelasticpooltf01"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_mssql_server.sqlserver.name

  sku {
    name     = "BasicPool"
    tier     = "Basic"
    capacity = 50
  }
  per_database_settings {
    min_capacity = 0.5
    max_capacity = 2
  }
}
