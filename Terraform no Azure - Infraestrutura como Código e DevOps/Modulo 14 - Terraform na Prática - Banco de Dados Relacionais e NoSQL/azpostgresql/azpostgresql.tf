provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-postgresql"
  location = "brazilsouth"
}

resource "azurerm_postgresql_server" "azpsqlservertf0265" {
  name                = "azpsqlservertf0265"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  administrator_login          = "psqladmin"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "GP_Gen5_4"
  version    = "11"
  storage_mb = 640000

  backup_retention_days        = 7
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = true

  public_network_access_enabled    = true
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}

resource "azurerm_postgresql_database" "azpsqldbtf0265" {
  name                = "azpsqldbtf0265"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_postgresql_server.azpsqlservertf0265.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

data "http" "ip_address" {
  url = "https://api.ipify.org"
  request_headers = {
    Accepy = "text/plain"
  }
}

resource "azurerm_postgresql_firewall_rule" "myip" {
  name                = "personalip"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_postgresql_server.azpsqlservertf0265.name
  start_ip_address    = data.http.ip_address.response_body
  end_ip_address      = data.http.ip_address.response_body
}

resource "azurerm_postgresql_firewall_rule" "allow-azservices" {
  name                = "allow-azservices"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_postgresql_server.azpsqlservertf0265.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}