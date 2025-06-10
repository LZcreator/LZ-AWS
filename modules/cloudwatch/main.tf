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

  # Number of consecutive periods the condition must be met before triggering the alarm
  evaluation_periods = 2
  metric_name        = "CPUUtilization"
  namespace          = "AWS/EC2"
  period             = 300
  statistic          = "Average"

  # Threshold that triggers the alarm when exceeded (80%)
  threshold          = 80
  alarm_description  = "Alarm when CPU exceeds 80%"
  actions_enabled    = true

  # Action to execute when the alarm is triggered, in this case, sending a notification to an SNS topic
  alarm_actions = [var.sns_topic_arn]
}