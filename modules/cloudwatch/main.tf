# Creación de un grupo de logs en CloudWatch
resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "app-log-group"  # Nombre del grupo de logs
  retention_in_days = var.log_retention_days  # Días que se mantienen los logs antes de ser eliminados
}

# Creación de una alarma en CloudWatch para monitorear el uso de CPU

resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  # Utiliza la variable "enable_cpu_alarm" para condicionar la creación de la alarma:
  # Si es true se crea (count = 1); si es false, no se crea (count = 0)
  count = var.enable_cpu_alarm ? 1 : 0

  alarm_name = "HighCPUUtilization"

  # Operador de comparación; la alarma se activa si la métrica es mayor que el umbral
  comparison_operator = "GreaterThanThreshold"

  # Número de períodos consecutivos en los que la condición debe cumplirse para activar la alarma
  evaluation_periods = 2
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = 300
  statistic = "Average"

  # Umbral que, al ser superado (80%), activa la alarma
  threshold = 80
  alarm_description = "Alarma cuando la CPU supera el 80%"
  actions_enabled = true

  # Acción que se ejecuta al dispararse la alarma, en este caso, enviar una notificación a un topic SNS
  alarm_actions = [var.sns_topic_arn]
}

