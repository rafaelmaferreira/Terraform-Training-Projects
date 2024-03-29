provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-azcosmosdb"
  location = "brazilsouth"
}

resource "azurerm_cosmosdb_account" "cosmosdbaccount" {
  name                = "cosmosdbaccount-tf"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = true

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  capabilities {
    name = "EnableAggregationPipeline"
  }

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }

  capabilities {
    name = "MongoDBv3.4"
  }
  capabilities {
    name = "EnableCassandra"
  }

  geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
  }
}
