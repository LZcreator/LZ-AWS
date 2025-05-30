// Variable que habilita o deshabilita la creación de la alarma de CPU.
// Cuando es false, la alarma no se crea, ayudando a evitar cargos innecesarios en entornos de desarrollo.
variable "enable_cpu_alarm" {
  description = "Habilitar la creación de la alarma de CPU."
  type        = bool
  default     = true
}

// Variable que almacena el ARN del topic de SNS al que se enviarán las notificaciones cuando se dispare la alarma.
// Debes reemplazar el valor por el ARN real de tu entorno.
variable "sns_topic_arn" {
  description = "ARN del topic de SNS para notificaciones de la alarma."
  type        = string
  default     = "arn:aws:sns:region:account-id:your-topic-name"
}

// Variable que define el número de días que se mantendrán los logs en el grupo de logs de CloudWatch
// antes de su eliminación. Esto ayuda a controlar el almacenamiento y los costos asociados.
variable "log_retention_days" {
  description = "Número de días para retener los logs en CloudWatch Logs."
  type        = number
  default     = 14
}