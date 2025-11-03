terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {
    # Backend config will be provided via backend.tf in environments
  }
}

provider "azurerm" {
  features {}
}

# Generate SSH key pair
resource "tls_private_key" "vm_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save SSH private key locally
resource "local_file" "ssh_private_key" {
  content         = tls_private_key.vm_ssh.private_key_pem
  filename        = "azure_vm_key.pem"
  file_permission = "0600"
}

# Module calls
module "network" {
  source = "./modules/network"

  resource_group_name = var.resource_group_name
  location           = var.location
  vnet_cidr          = var.vnet_cidr
  subnet_cidr        = var.subnet_cidr
  environment        = var.environment
}

module "security" {
  source = "./modules/security"

  resource_group_name = var.resource_group_name
  location           = var.location
  environment        = var.environment
}

module "compute" {
  source = "./modules/compute"

  resource_group_name = var.resource_group_name
  location           = var.location
  subnet_id          = module.network.subnet_id
  nsg_id             = module.security.nsg_id
  admin_username     = var.admin_username
  public_key         = tls_private_key.vm_ssh.public_key_openssh
  vm_size            = var.vm_size
  environment        = var.environment

  # Custom data script for installation
  custom_data = base64encode(templatefile("${path.module}/scripts/setup-vm.sh", {
    install_docker = var.install_docker
    install_nginx  = var.install_nginx
  }))
}