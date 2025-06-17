# Create a CloudWatch log group
resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "app-log-group"              # Name of the log group
  retention_in_days = var.log_retention_days       # Number of days logs are retained before deletion
}

# Create a CloudWatch alarm to monitor CPU usage
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  # Use the "enable_cpu_alarm" variable to conditionally create the alarm:
  # If true, the alarm is created (count = 1); if false, it is not created (count = 0)
  count = var.enable_cpu_alarm ? 1 : 0

  alarm_name = "HighCPUUtilization"

  # Comparison operator; the alarm triggers if the metric exceeds the threshold
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Triggers when CPU exceeds 80%"
  actions_enabled     = true
  alarm_actions       = [var.sns_topic_arn]

  tags = var.common_tags
}
