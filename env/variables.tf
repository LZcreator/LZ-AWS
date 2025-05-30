variable "region" {
  description = "Región de despliegue"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block de la VPC"
  default     = "10.0.0.0/16"
}