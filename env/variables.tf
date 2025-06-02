variable "region" {
  description = "Región de despliegue"
  default     = "eu-west-3"
}

variable "vpc_cidr" {
  description = "CIDR block de la VPC"
  default     = "10.0.0.0/16"
}