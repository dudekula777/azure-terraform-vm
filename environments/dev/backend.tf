# For initial setup, use local backend
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

# Comment out or remove the azurerm backend block for now
/*
terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatestorage12345"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
*/