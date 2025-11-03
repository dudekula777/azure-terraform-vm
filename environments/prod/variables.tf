variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-prod-azure-vm"
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "East US 2"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "vm_size" {
  description = "Size of the VM"
  type        = string
  default     = "Standard_B2s"
}

variable "install_docker" {
  description = "Whether to install Docker"
  type        = bool
  default     = true
}

variable "install_nginx" {
  description = "Whether to install Nginx"
  type        = bool
  default     = true
}

variable "vnet_cidr" {
  description = "CIDR block for the virtual network"
  type        = string
  default     = "10.1.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.1.1.0/24"
}

variable "allowed_ssh_ips" {
  description = "List of IP addresses allowed for SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"] # Restrict this in production
}

variable "allowed_http_ips" {
  description = "List of IP addresses allowed for HTTP access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}