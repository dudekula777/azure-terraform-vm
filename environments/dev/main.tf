module "azure_vm" {
  source = "../.."

  resource_group_name = "rg-dev-azure-vm"
  location           = "East US"
  environment        = "dev"
  admin_username     = "azureuser"
  vm_size           = "Standard_B1s"
  install_docker    = true
  install_nginx     = true
}