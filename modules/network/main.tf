# VPC
resource "aws_vpc" "vpc_virginia" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge(var.common_tags, {
    Name = "vpc_virginia-${var.sufix}"
  })
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc_virginia.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = merge(var.common_tags, {
    Name = "Public_subnet-${var.sufix}"
  })
}

# Subnet privada
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc_virginia.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = merge(var.common_tags, {
    Name = "Private_subnet-${var.sufix}"
  })
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_virginia.id

  tags = merge(var.common_tags, {
    Name = "igw_vpc-${var.sufix}"
  })
}

# Tabla de rutas pública
resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_virginia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(var.common_tags, {
    Name = "public_crt-${var.sufix}"
  })
}

# Asociación de subnet pública a tabla de rutas
resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}

# Security Group básico
resource "aws_security_group" "default" {
  name        = "Public Instance SG"
  description = "Basic access security group"
  vpc_id      = aws_vpc.vpc_virginia.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(var.common_tags, {
    Name = "Public_Instance_SG-${var.sufix}"
  })
}