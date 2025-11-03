location           = "centralus"
resource_group_name = "rg-dev-vm"
prefix             = "dev"
vm_size            = "Standard_B1s"
admin_username     = "azureuser"

tags = {
  Environment = "dev"
  Project     = "azure-vm-terraform"
  ManagedBy   = "github-actions"
}