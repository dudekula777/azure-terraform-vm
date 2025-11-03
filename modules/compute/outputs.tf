output "vm_id" {
  description = "Virtual Machine ID"
  value       = azurerm_linux_virtual_machine.main.id
}

output "vm_name" {
  description = "Virtual Machine name"
  value       = azurerm_linux_virtual_machine.main.name
}

output "vm_public_ip" {
  description = "Public IP address of the VM"
  value       = azurerm_public_ip.main.ip_address
}

output "vm_private_ip" {
  description = "Private IP address of the VM"
  value       = azurerm_network_interface.main.private_ip_address
}

output "network_interface_id" {
  description = "Network Interface ID"
  value       = azurerm_network_interface.main.id
}