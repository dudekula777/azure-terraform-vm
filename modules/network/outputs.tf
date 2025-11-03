output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "subnet_id" {
  value = azurerm_subnet.main.id
}

output "public_ip_id" {
  value = azurerm_public_ip.main.id
}

output "vnet_name" {
  value = azurerm_virtual_network.main.name
}