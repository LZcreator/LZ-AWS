variable "budget_limit" {
  description = "Maximum monthly amount"
  type        = string
  default     = "1.00"
}

variable "threshold" {
  description = "Percentage of the budget at which to trigger an alert"
  type        = number
  default     = 80
}

variable "start_date" {
  description = "Start date of the budget (YYYY-MM-DD_hh:mm)"
  type        = string
  default     = "2025-05-01_00:00"
}

variable "sufix" {
  description = "Suffix to uniquely identify resources"
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}

variable "alert_email" {
  description = "Email address to receive budget alerts"
  type        = string
  default = "landingzone899@gmail.com"
}
