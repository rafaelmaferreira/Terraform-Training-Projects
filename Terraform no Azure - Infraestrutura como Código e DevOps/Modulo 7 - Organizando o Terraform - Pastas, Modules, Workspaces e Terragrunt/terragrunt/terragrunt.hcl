remote_state {
    backend = "azurerm"
    config = {
    resource_group_name  = "storagerg"
    storage_account_name = "tftreinamento7ii"
    container_name       = "terraform"
    key                  = "4iWJ/MfdDCyrAihu0Tm6VBUIzdEiAZ2uCSK8e033vr9CT83pnXWQ+OABZSAyEHkFdk9OI3o4lkpJ+ASt3+DC+A=="
    }
}

inputs = {
    location = "brazilsouth"
    rg = "rg-terragrunt"
}