variable "enable_cpu_alarm" {
  description = "Activa la alarma de CPU"
  type        = bool
}

variable "sns_topic_arn" {
  description = "ARN del tema SNS"
  type        = string
}

variable "common_tags" {
  description = "Etiquetas comunes aplicadas a los recursos"
  type        = map(string)
}
