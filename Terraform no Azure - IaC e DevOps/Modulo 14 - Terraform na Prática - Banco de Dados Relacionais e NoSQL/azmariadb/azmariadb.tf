provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-mariadb"
  location = "brazilsouth"
}

resource "azurerm_mariadb_server" "mariadbserver" {
  name                = "mariadbservertf054"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  administrator_login          = "mariadbadmin"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "10.2"

  backup_retention_days            = 7
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
  geo_redundant_backup_enabled     = false
  auto_grow_enabled             = true
}

resource "azurerm_mariadb_database" "maridb" {
  name                = "mariadbserverdatabasetf054"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mariadb_server.mariadbserver.name
  charset             = "utf8mb4"
  collation           = "utf8mb4_unicode_520_ci"
}

data "http" "ip_address" {
  url = "https://api.ipify.org"
  request_headers = {
    Accepy = "text/plain"
  }
}

resource "azurerm_mariadb_firewall_rule" "myip" {
  name                = "personalip"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mariadb_server.mariadbserver.name
  start_ip_address    = data.http.ip_address.response_body
  end_ip_address      = data.http.ip_address.response_body
}

resource "azurerm_mariadb_firewall_rule" "allow-azservices" {
  name                = "allow-azservices"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mariadb_server.mariadbserver.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

