output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.landing_zone_vpc.id
}