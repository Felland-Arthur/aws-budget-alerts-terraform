#!/bin/bash
# Destroy script for AWS Budget Alerts

set -e

echo "Ì∑ëÔ∏è  Destroying AWS Budget Alerts infrastructure..."

# Plan destruction
echo "Ì≥ã Planning destruction..."
terraform plan -destroy -out=destroy-plan

# Ask for confirmation
read -p "‚ùì Are you sure you want to destroy all budget alert resources? (yes/no): " confirm
if [ "$confirm" != "yes" ]; then
    echo "‚ùå Destruction cancelled"
    exit 0
fi

# Apply destruction
echo "Ì¥Ñ Destroying resources..."
terraform apply destroy-plan

echo ""
echo "‚úÖ Destruction completed!"
echo "Ì≥ß SNS topic and budget alerts have been removed"
