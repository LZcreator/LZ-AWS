# CloudWatch Log Group
resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "app-log-group"
  retention_in_days = var.log_retention_days

  tags = var.common_tags
}

# Conditional CloudWatch CPU Alarm
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  count = var.enable_cpu_alarm ? 1 : 0

  alarm_name          = "HighCPUUtilization"
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
