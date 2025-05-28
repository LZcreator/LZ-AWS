#
variable "instance_name" {
  description = "Names for the public instances"
  type = set(string)
}

 variable "public_subnet" {
   description = "CIDR public subnet"
   type        = string
 }

 variable "private_subnet" {
   description = "CIDR private subnet"
   type        = string
 }

variable "ec2_specs" {
  description = "EC2 specifications including AMI and instance type"
  type = object({
    ami           = string
    instance_type = string
  })
  default = {
    ami           = "ami-0abcdef1234567890"
    instance_type = "t2.micro"
  }
}


variable "enable_monitoring" {
  description = "Habilita el despliegue de un servidor de monitoreo"
  type        = number

}

variable "ingress_ports_list" {
  description = "Lista de puertos ingress"
  type = list(number)
}
