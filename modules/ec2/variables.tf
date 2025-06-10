variable "instance_name" {
  description = "Names for the public instances"
  type        = set(string)
}

variable "public_subnet" {
  description = "The public subnet"
  type        = string
}

variable "private_subnet" {
  description = "The private subnet"
  type        = string
}

variable "ec2_specs" {
  description = "EC2 specifications including AMI and instance type"
  type = object({
    ami           = string
    instance_type = string
  })
  
  default = {
    ami           = "var.ec2_specs.ami"
    instance_type = "var.ec2_specs.instance_type"
  }
}

variable "enable_monitoring" {
  description = "Enables the deployment of a monitoring server"
  type        = number
}