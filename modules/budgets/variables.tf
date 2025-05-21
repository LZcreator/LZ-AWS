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
  description = "Start date of the budget (YYYY-MM-DD)"
  type        = string
  default     = "2025-05-01"
}

variable "sufix" {
  description = "Suffix to uniquely identify resources"
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}
