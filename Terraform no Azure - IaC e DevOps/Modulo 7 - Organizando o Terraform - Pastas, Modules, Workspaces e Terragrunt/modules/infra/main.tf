resource "azurerm_resource_group" "rg" {
  name     = "rg-appservice${lower(var.ambiente)}"
  location = var.location
}

resource "azurerm_service_plan" "plan" {
  name                = "appserviceplan0354${lower(var.ambiente)}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "appservice" {
  name                = "tfappservicemod0545${lower(var.ambiente)}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.plan.id
  site_config {
  }
  app_settings = {
    "chave" = "123456"
  }

}
