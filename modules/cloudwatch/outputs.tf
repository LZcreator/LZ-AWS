// Salida que muestra el nombre del grupo de logs creado en CloudWatch.
output "cloudwatch_log_group_name" {
  description = "Nombre del grupo de logs de CloudWatch creado."
  value       = aws_cloudwatch_log_group.app_logs.name
}

// Salida condicional para la alarma de CPU.
// Dado que el recurso "aws_cloudwatch_metric_alarm.cpu_high" utiliza "count",
// se almacena como una lista.
// Si "enable_cpu_alarm" es true, la lista contendrá un elemento y se mostrará el nombre de la alarma.
// De lo contrario, se indicará que la alarma no se ha creado.
output "cpu_alarm_name" {
  description = "Nombre de la alarma de CPU en CloudWatch (si ha sido creada)."
  value       = length(aws_cloudwatch_metric_alarm.cpu_high) > 0 ? aws_cloudwatch_metric_alarm.cpu_high[0].alarm_name : "Alarma no creada"
}