variable "budget_name" {
  description = "The name of the budget"
  type        = string
  default     = "monthly-budget-alert"
}

variable "budget_limit" {
  description = "The monthly budget limit in USD"
  type        = number
  default     = 325  # Set to $325 as requested
}

variable "alert_emails" {
  description = "List of email addresses to receive budget alerts"
  type        = list(string)
  default     = ["arthurfelland@gmail.com"]  # Update with your email
}

variable "sns_topic_name" {
  description = "Name of the SNS topic for budget alerts"
  type        = string
  default     = "budget-alerts"
}

variable "enable_cross_account" {
  description = "Whether to enable cross-account budget access"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    Project     = "budget-alerts"
    Environment = "production"
    ManagedBy   = "terraform"
    Owner       = "Felland-Arthur"
  }
}
