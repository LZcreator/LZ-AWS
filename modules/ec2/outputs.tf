# Output: Public EC2 Instance ID
output "public_instance_id" {
  description = "Public instance ID"
  value       = aws_instance.public_instance.id
}

# Output: Public EC2 Instance Public IP
output "public_instance_public_ip" {
  description = "Public IP of the public instance"
  value       = aws_instance.public_instance.public_ip
}

# Output: Monitoring EC2 Instance ID (Fixed Conditional Logic)
output "monitoring_instance_id" {
  description = "Monitoring instance ID"
  value       = lookup(aws_instance.monitoring_instance, "instance_1", null) != null ? aws_instance.monitoring_instance["instance_1"].id : null
}

# Output: Monitoring EC2 Instance Public IP (Fixed Conditional Logic)
output "monitoring_instance_public_ip" {
  description = "Public IP of the monitoring instance"
  value       = lookup(aws_instance.monitoring_instance, "instance_1", null) != null ? aws_instance.monitoring_instance["instance_1"].public_ip : null
}
