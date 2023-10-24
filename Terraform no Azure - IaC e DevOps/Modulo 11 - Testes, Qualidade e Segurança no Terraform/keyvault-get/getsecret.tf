provider "azurerm" {
  features {
  }
}

data "azurerm_key_vault" "getkeyvault" {
  name                = "keyvaulttf0561"
  resource_group_name = "rg-keyvault"
}

data "azurerm_key_vault_secret" "getsecret" {
  name         = "secret-terraform"
  key_vault_id = data.azurerm_key_vault.getkeyvault.id
}

output "secret" {
  value = nonsensitive(data.azurerm_key_vault_secret.getsecret.value)
}