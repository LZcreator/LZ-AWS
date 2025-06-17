# CloudWatch Log Group Output
output "cloudwatch_log_group_name" {
  description = "Name of the created CloudWatch log group"
  value       = aws_cloudwatch_log_group.app_logs.name
}

# Conditional CPU Alarm Output
output "cpu_alarm_name" {
  description = "Name of the CPU alarm in CloudWatch (if it was created)."
  value       = var.enable_cpu_alarm ? aws_cloudwatch_metric_alarm.cpu_high[0].alarm_name : "Alarm not created"
}
