#!/bin/bash
# Deployment script for AWS Budget Alerts with Terraform

set -e

echo "� Deploying AWS Budget Alerts with Terraform..."
echo "� Budget: $325/month"
echo "� Alerts: 80%, 90%, 100% (Actual), 120% (Forecasted)"
echo ""

# Check if terraform.tfvars exists
if [ ! -f terraform.tfvars ]; then
    echo "❌ terraform.tfvars not found!"
    echo "   Please copy terraform.tfvars.example to terraform.tfvars"
    echo "   and update with your email address"
    exit 1
fi

# Initialize Terraform
echo "� Initializing Terraform..."
terraform init

# Validate configuration
echo "✅ Validating Terraform configuration..."
terraform validate

# Plan deployment
echo "� Planning deployment..."
terraform plan -out=tfplan

# Ask for confirmation
read -p "❓ Do you want to apply this Terraform plan? (yes/no): " confirm
if [ "$confirm" != "yes" ]; then
    echo "❌ Deployment cancelled"
    exit 0
fi

# Apply configuration
echo "� Applying Terraform configuration..."
terraform apply tfplan

# Get outputs
echo ""
echo "� Deployment outputs:"
terraform output

echo ""
echo "� Deployment completed!"
echo "� Check your email (arthurfelland@gmail.com) to confirm SNS subscription"
echo "� Budget alerts will trigger at: 80%, 90%, 100% (Actual), 120% (Forecasted)"
echo ""
echo "� To destroy resources later, run: terraform destroy"
