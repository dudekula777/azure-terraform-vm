variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the network interface"
  type        = string
}

variable "nsg_id" {
  description = "Network Security Group ID"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "public_key" {
  description = "Public SSH key for the VM"
  type        = string
}

variable "vm_size" {
  description = "Size of the VM"
  type        = string
  default     = "Standard_B1s"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "custom_data" {
  description = "Custom data script to run during VM provisioning"
  type        = string
  default     = ""
}