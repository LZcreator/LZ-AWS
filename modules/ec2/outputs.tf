
output "public_instance_id" {
  description = "ID de la instancia pública creada"
  value       = aws_instance.public_instance.id
}

output "public_instance_public_ip" {
  description = "Dirección IP pública de la instancia pública"
  value       = aws_instance.public_instance.public_ip
}

output "monitoring_instance_id" {
  description = "ID de la instancia de monitoreo"
  value       = length(aws_instance.monitoring_instance) > 0 ? aws_instance.monitoring_instance[0].id : null
}

output "monitoring_instance_public_ip" {
  description = "Dirección IP pública de la instancia de monitoreo"
  value       = length(aws_instance.monitoring_instance) > 0 ? aws_instance.monitoring_instance[0].public_ip : null
}
