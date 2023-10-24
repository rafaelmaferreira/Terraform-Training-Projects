resource "azurerm_resource_group" "rgstorage" {
  name     = var.rg
  location = var.location
}

resource "random_string" "random" {
  length  = 3
  special = false
  upper   = false
  numeric = true
}
resource "azurerm_storage_account" "storagetf" {
  name                     = "tftreinamento${random_string.random.result}"
  location                 = var.location
  resource_group_name      = var.rg
  account_tier             = "Standard"
  access_tier              = "Hot"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                 = "terraform"
  storage_account_name = azurerm_storage_account.storagetf.name
  depends_on           = [azurerm_storage_account.storagetf]
}
