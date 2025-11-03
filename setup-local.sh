#!/bin/bash

# Local setup script for Azure VM Terraform project

set -e

echo "🚀 Setting up Azure VM Terraform project locally..."

# Check if Azure CLI is installed
if ! command -v az &> /dev/null; then
    echo "❌ Azure CLI is not installed. Please install it first:"
    echo "https://docs.microsoft.com/en-us/cli/azure/install-azure-cli"
    exit 1
fi

# Check if Terraform is installed
if ! command -v terraform &> /dev/null; then
    echo "❌ Terraform is not installed. Please install it first:"
    echo "https://learn.hashicorp.com/tutorials/terraform/install-cli"
    exit 1
fi

# Login to Azure
echo "🔐 Please login to Azure..."
az login

# Create service principal for Terraform
echo "👤 Creating service principal for Terraform..."
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

az ad sp create-for-rbac --name "terraform-local-dev" --role contributor \
    --scopes /subscriptions/$SUBSCRIPTION_ID \
    --sdk-auth

echo ""
echo "✅ Setup completed!"
echo ""
echo "📋 Next steps:"
echo "1. Save the JSON output above as GitHub secret 'AZURE_CREDENTIALS'"
echo "2. Run 'cd environments/dev && terraform init'"
echo "3. Run 'terraform plan' to see infrastructure changes"
echo "4. Run 'terraform apply' to create the infrastructure"