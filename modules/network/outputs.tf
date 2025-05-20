output "vpc_id" {
  value       = aws_vpc.vpc_virginia.id
  description = "ID de la VPC creada"
}

output "public_subnet_id" {
  value       = aws_subnet.public_subnet.id
  description = "ID de la subnet pública"
}

output "private_subnet_id" {
  value       = aws_subnet.private_subnet.id
  description = "ID de la subnet privada"
}

output "security_group_id" {
  value       = aws_security_group.default.id
  description = "ID del grupo de seguridad creado"
}
