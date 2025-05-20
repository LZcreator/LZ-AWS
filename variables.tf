variable "aws_region" {
  description = "Region donde se desplegara la infraestructura"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Nombre del proyecto (para tags y nombres de recursos)"
  type        = string
}

variable "environment" {
  description = "Nombre del entorno (dev, staging, prod)"
  type        = string
}

variable "common_tags" {
  description = "Tags comunes para aplicar a todos los recursos"
  type        = map(string)
}