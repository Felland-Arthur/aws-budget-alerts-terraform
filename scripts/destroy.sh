#!/bin/bash
# Destroy script for AWS Budget Alerts

set -e

echo "�️  Destroying AWS Budget Alerts infrastructure..."

# Plan destruction
echo "� Planning destruction..."
terraform plan -destroy -out=destroy-plan

# Ask for confirmation
read -p "❓ Are you sure you want to destroy all budget alert resources? (yes/no): " confirm
if [ "$confirm" != "yes" ]; then
    echo "❌ Destruction cancelled"
    exit 0
fi

# Apply destruction
echo "� Destroying resources..."
terraform apply destroy-plan

echo ""
echo "✅ Destruction completed!"
echo "� SNS topic and budget alerts have been removed"
