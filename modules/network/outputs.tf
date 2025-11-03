output "vnet_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.main.id
}

output "vnet_name" {
  description = "Virtual Network name"
  value       = azurerm_virtual_network.main.name
}

output "subnet_id" {
  description = "Subnet ID"
  value       = azurerm_subnet.main.id
}

output "subnet_name" {
  description = "Subnet name"
  value       = azurerm_subnet.main.name
}

output "public_ip_id" {
  description = "Public IP address ID"
  value       = azurerm_public_ip.main.id
}

output "public_ip_address" {
  description = "Public IP address"
  value       = azurerm_public_ip.main.ip_address
}