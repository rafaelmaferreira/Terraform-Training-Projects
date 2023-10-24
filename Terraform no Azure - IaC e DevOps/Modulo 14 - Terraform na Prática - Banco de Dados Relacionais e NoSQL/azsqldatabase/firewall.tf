data "http" "ip_address" {
  url = "https://api.ipify.org"
  request_headers = {
    Accepy = "text/plain"
  }
}

resource "azurerm_mssql_firewall_rule" "sqlfirewall-my-ip" {
  name = "personal-ip"
  //resource_group_name = azurerm_resource_group.rg.name
  server_id        = azurerm_mssql_server.sqlserver.id
  start_ip_address = data.http.ip_address.response_body
  end_ip_address   = data.http.ip_address.response_body
}

resource "azurerm_mssql_firewall_rule" "sqlfirewall-azureservices" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.sqlserver.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

