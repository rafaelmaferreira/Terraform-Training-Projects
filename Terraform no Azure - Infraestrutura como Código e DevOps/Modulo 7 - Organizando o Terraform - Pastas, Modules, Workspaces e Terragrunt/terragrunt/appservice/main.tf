resource "azurerm_resource_group" "rg" {
  name     = var.rg
  location = var.location
}

resource "azurerm_service_plan" "plan" {
  name                = "appservicet0056"
  location            = var.location
  resource_group_name = var.rg
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "appservice" {
  name                = "apptf0564"
  location            = var.location
  resource_group_name = var.rg
  service_plan_id     = azurerm_service_plan.plan.id
  site_config {
  }
  app_settings = {
    "chave" = "123456"
  }
}