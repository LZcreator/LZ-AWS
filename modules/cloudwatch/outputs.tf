# Output that shows the name of the created CloudWatch log group
output "cloudwatch_log_group_name" {
  description = "Name of the created CloudWatch log group"
  value       = aws_cloudwatch_log_group.app_logs.name
}

# Conditional output for the CPU alarm
# Since the "aws_cloudwatch_metric_alarm.cpu_high" resource uses "count",
# it is stored as a list
# If "enable_cpu_alarm" is true, the list will contain one element and the alarm name will be shown
# Otherwise, it will indicate that the alarm was not created
output "cpu_alarm_name" {
  description = "Name of the CPU alarm in CloudWatch (if it was created)."
  value       = length(aws_cloudwatch_metric_alarm.cpu_high) > 0 ? aws_cloudwatch_metric_alarm.cpu_high[0].alarm_name : "Alarm not created"
}