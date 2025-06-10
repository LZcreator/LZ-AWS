output "vpc_id" {
  description = "ID the created VPC"
  value       = aws_vpc.landing_zone_vpc.id
}