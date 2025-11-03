output "vm_public_ip" {
  description = "Public IP address of the VM"
  value       = module.compute.vm_public_ip
}

output "vm_private_ip" {
  description = "Private IP address of the VM"
  value       = module.compute.vm_private_ip
}

output "ssh_connection_command" {
  description = "SSH connection command"
  value       = "ssh -i azure_vm_key.pem ${var.admin_username}@${module.compute.vm_public_ip}"
}

output "nginx_url" {
  description = "URL to access Nginx"
  value       = "http://${module.compute.vm_public_ip}"
}

output "ssh_private_key_file" {
  description = "Path to the generated SSH private key"
  value       = local_file.ssh_private_key.filename
  sensitive   = true
}