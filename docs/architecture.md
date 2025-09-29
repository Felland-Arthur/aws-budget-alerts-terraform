# Architecture: AWS Budget Alerts

## System Overview


## Alert Thresholds

- **80% of $325** ($260): Warning - Approaching budget
- **90% of $325** ($292.50): Critical - Close to budget limit  
- **100% of $325** ($325): Exceeded - Budget limit reached
- **120% of $325** ($390): Forecasted - Projected to exceed budget

## Components

1. **AWS Budgets**: Monitors AWS spending against $325 monthly budget
2. **Amazon SNS**: Sends email notifications when thresholds are crossed
3. **Terraform**: Infrastructure as Code for reproducible deployments
4. **IAM**: Security and access control

## Cost Analysis

- **AWS Budgets**: Free service
- **SNS**: First 1,000 emails/month free
- **Estimated monthly cost**: $0.00
- **Budget savings**: Prevents unexpected charges over $325
