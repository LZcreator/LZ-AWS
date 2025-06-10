# Resource that creates a monthly AWS budget
resource "aws_budgets_budget" "monthly_budget" {
  name              = "budget-${var.sufix}"  # Budget name with dynamic suffix
  budget_type       = "COST"                 # Budget based on cost (not usage or RI/Savings Plans)
  limit_amount      = var.budget_limit       # Maximum allowed amount in USD
  limit_unit        = "USD"
  time_unit         = "MONTHLY"              # Budget is evaluated monthly

  # Specifies what types of costs are included in the budget calculation
  cost_types {
    include_credit             = true
    include_discount           = true
    include_other_subscription = true
    include_recurring          = true
    include_refund             = true
    include_subscription       = true
    include_support            = true
    include_tax                = true
    include_upfront            = true
    use_amortized              = false
    use_blended                = false
  }

  # Start date for the budget period
  time_period_start = "2025-05-01_00:00"

  # Notification settings for when budget thresholds are exceeded
  notification {
    comparison_operator = "GREATER_THAN"  # Triggers when cost exceeds threshold
    threshold           = var.threshold   # Threshold percentage (e.g., 80 means 80%)
    threshold_type      = "PERCENTAGE"    # Interprets threshold as a percentage of the budget
    notification_type   = "ACTUAL"        # Based on actual usage (not forecasted)
    
    # List of email addresses to notify when the threshold is exceeded
    subscriber_email_addresses = [var.alert_email]
  }
}