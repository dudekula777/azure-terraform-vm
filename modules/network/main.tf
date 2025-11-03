resource "azurerm_virtual_network" "main" {
  name                = "vnet-${var.environment}-${replace(var.location, " ", "")}"
  address_space       = [var.vnet_cidr]
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    environment = var.environment
  }
}

resource "azurerm_subnet" "main" {
  name                 = "subnet-${var.environment}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.subnet_cidr]
}

resource "azurerm_public_ip" "main" {
  name                = "pip-${var.environment}-vm"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

  tags = {
    environment = var.environment
  }
}