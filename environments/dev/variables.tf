# Azure authentication variables
variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Azure Client Secret"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
  sensitive   = true
}

# Infrastructure variables
variable "location" {
  description = "Azure region"
  type        = string
  default     = "centralus"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-dev-vm"
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "dev-vm-instance"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}