resource "aws_budgets_budget" "ec2" {
  name              = var.budget-name
  budget_type       = var.budget-type
  limit_amount      = var.budget-limit_amount
  limit_unit        = var.budget-limit_unit
  time_period_start = var.budget-time_period_start
  time_period_end   = var.budget-time_period_end
  time_unit         = var.budget-time_unit

  cost_filters = {
    Service = "Amazon Elastic Compute Cloud - Compute"
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["test@example.com"]
  }
}