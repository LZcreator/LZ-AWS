output "public_instance_id" {
  description = "ID of the created public instance"
  value       = aws_instance.public_instance.id
}

output "public_instance_public_ip" {
  description = "Public IP address of the public instance"
  value       = aws_instance.public_instance.public_ip
}

output "monitoring_instance_id" {
  description = "ID of the monitoring instance"
  value       = length(aws_instance.monitoring_instance) > 0 ? aws_instance.monitoring_instance[0].id : null
}

output "monitoring_instance_public_ip" {
  description = "Public IP address of the monitoring instance"
  value       = length(aws_instance.monitoring_instance) > 0 ? aws_instance.monitoring_instance[0].public_ip : null
}
