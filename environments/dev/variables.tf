variable "subscription_id" {}
variable "tenant_id" {}
variable "client_id" {}
variable "client_secret" {
  description = "Azure Service Principal client secret"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-dev-vm"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "centralus"
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "dev"
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username"
  type        = string
  default     = "azureuser"
  validation {
    condition     = length(var.admin_username) >= 3 && length(var.admin_username) <= 24
    error_message = "Admin username must be between 3 and 24 characters."
  }
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "terraform-vm"
    ManagedBy   = "terraform"
    Owner       = "devops-team"
  }
}