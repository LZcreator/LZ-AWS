variable "aws_region" {
  description = "region where to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "name of the project"
  type        = string
}

variable "environment" {
  description = "name of the enviroment (dev, staging, prod)"
  type        = string
}

variable "common_tags" {
  description = "common tags"
  type        = map(string)
}