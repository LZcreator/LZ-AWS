# Variable that enables or disables the creation of the CPU alarm
# When set to false, the alarm is not created, helping to avoid unnecessary charges in development environments
variable "enable_cpu_alarm" {
  description = "Enable the creation of the CPU alarm."
  type        = bool
  default     = true
}

# Variable that stores the ARN of the SNS topic to which alarm notifications will be sent
# You should replace the value with the actual ARN for your environment
variable "sns_topic_arn" {
  description = "ARN of the SNS topic for alarm notifications"
  type        = string
  default     = "arn:aws:sns:region:account-id:your-topic-name"
}

# Variable that defines how many days logs will be retained in the CloudWatch Logs group
# before being deleted. This helps manage storage and associated costs
variable "log_retention_days" {
  description = "Number of days to retain logs in CloudWatch Logs"
  type        = number
  default     = 14
}

# Project information (added to align with expected module variables)
variable "project" {
  description = "Project name"
  type        = string
}

variable "sufix" {
  description = "Suffix used for naming resources"
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
}
