output "budget_id" {
  description = "The ID of the created budget"
  value       = aws_budgets_budget.monthly_budget.id
}

output "sns_topic_arn" {
  description = "The ARN of the SNS topic for budget alerts"
  value       = aws_sns_topic.budget_alerts.arn
}

output "sns_topic_name" {
  description = "The name of the SNS topic"
  value       = aws_sns_topic.budget_alerts.name
}

output "subscribed_emails" {
  description = "List of email addresses subscribed to budget alerts"
  value       = var.alert_emails
}

output "budget_details" {
  description = "Details about the configured budget"
  value = {
    name         = aws_budgets_budget.monthly_budget.name
    limit        = aws_budgets_budget.monthly_budget.limit_amount
    unit         = aws_budgets_budget.monthly_budget.limit_unit
    time_unit    = aws_budgets_budget.monthly_budget.time_unit
    notifications = "80%, 90%, 100% (Actual), 120% (Forecasted)"
  }
}
