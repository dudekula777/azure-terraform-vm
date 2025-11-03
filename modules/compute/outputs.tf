output "vm_public_ip" {
  value = azurerm_linux_virtual_machine.main.public_ip_address
}

output "vm_private_ip" {
  value = azurerm_linux_virtual_machine.main.private_ip_address
}

output "ssh_private_key" {
  value     = tls_private_key.vm_ssh.private_key_openssh
  sensitive = true
}

output "ssh_public_key" {
  value = tls_private_key.vm_ssh.public_key_openssh
}

output "network_interface_id" {
  value = azurerm_network_interface.main.id
}