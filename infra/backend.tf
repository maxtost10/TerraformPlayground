terraform {
  backend "azurerm" {
    resource_group_name  = "YOUR-STATE-RG"
    storage_account_name = "YOURSTATESTORAGE"
    container_name       = "tfstate"
    key                  = "datalab.terraform.tfstate"
  }
}
