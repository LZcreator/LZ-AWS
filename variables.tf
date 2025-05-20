variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "virginia_cidr" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "sg_ingress_cidr" {
  type = string
}

variable "ec2_specs" {
  type = map(string)
}

variable "ingress_ports_list" {
  type = list(number)
}