# Enable or disable the CPU alarm creation
variable "enable_cpu_alarm" {
  description = "Enable the creation of the CPU alarm."
  type        = bool
  default     = true
}

# SNS topic ARN for alarm notifications
variable "sns_topic_arn" {
  description = "ARN of the SNS topic for CloudWatch alarm notifications"
  type        = string
}

# CloudWatch Logs retention period
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
