output "vpc_id" {
  value       = aws_vpc.vpc_virginia.id
  description = "ID of the VPC created"
}

output "public_subnet_id" {
  value       = aws_subnet.public_subnet.id
  description = "ID dof the public subnet"
}

output "private_subnet_id" {
  value       = aws_subnet.private_subnet.id
  description = "ID of the private subnet"
}

output "security_group_id" {
  value       = aws_security_group.default.id
  description = "ID of the security group"
}