variable "region" {
  description = "Deployment region"
  default     = "eu-west-3"
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC"
  default     = "10.0.0.0/16"
}