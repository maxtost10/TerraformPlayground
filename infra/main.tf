provider "azurerm" {
  features {}
}

provider "databricks" {
  azure_workspace_resource_id = azurerm_databricks_workspace.this.id
  azure_client_id             = var.client_id
  azure_client_secret         = var.client_secret
  azure_tenant_id             = var.tenant_id
}

resource "azurerm_resource_group" "this" {
  name     = "datalab-rg"
  location = "westeurope"
}

resource "azurerm_storage_account" "this" {
  name                     = "datalabstorage${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_databricks_workspace" "this" {
  name                        = "datalab-workspace"
  resource_group_name         = azurerm_resource_group.this.name
  location                    = azurerm_resource_group.this.location
  sku                         = "standard"
  managed_resource_group_name = "datalab-managed-rg"
}

resource "random_string" "suffix" {
  length  = 4
  special = false
}