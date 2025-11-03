resource_group_name = "rg-dev-vm"
location            = "East US"
prefix              = "dev"
vm_size             = "Standard_B2s"
admin_username      = "azureuser"

tags = {
  Environment = "development"
  Project     = "azure-vm-terraform"
  Team        = "devops"
  CostCenter  = "12345"
}