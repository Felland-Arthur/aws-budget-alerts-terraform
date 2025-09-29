#!/bin/bash
# Deployment script for AWS Budget Alerts with Terraform

set -e

echo "Ì∫Ä Deploying AWS Budget Alerts with Terraform..."
echo "Ì≥ä Budget: $325/month"
echo "Ì≥ß Alerts: 80%, 90%, 100% (Actual), 120% (Forecasted)"
echo ""

# Check if terraform.tfvars exists
if [ ! -f terraform.tfvars ]; then
    echo "‚ùå terraform.tfvars not found!"
    echo "   Please copy terraform.tfvars.example to terraform.tfvars"
    echo "   and update with your email address"
    exit 1
fi

# Initialize Terraform
echo "Ì≥¶ Initializing Terraform..."
terraform init

# Validate configuration
echo "‚úÖ Validating Terraform configuration..."
terraform validate

# Plan deployment
echo "Ì≥ã Planning deployment..."
terraform plan -out=tfplan

# Ask for confirmation
read -p "‚ùì Do you want to apply this Terraform plan? (yes/no): " confirm
if [ "$confirm" != "yes" ]; then
    echo "‚ùå Deployment cancelled"
    exit 0
fi

# Apply configuration
echo "Ì¥Ñ Applying Terraform configuration..."
terraform apply tfplan

# Get outputs
echo ""
echo "Ì≥ä Deployment outputs:"
terraform output

echo ""
echo "Ìæâ Deployment completed!"
echo "Ì≥ß Check your email (arthurfelland@gmail.com) to confirm SNS subscription"
echo "Ì≤∞ Budget alerts will trigger at: 80%, 90%, 100% (Actual), 120% (Forecasted)"
echo ""
echo "Ì¥ß To destroy resources later, run: terraform destroy"
