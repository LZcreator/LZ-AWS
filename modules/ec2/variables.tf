variable "instance_name" {
  description = "Nombres de las instancias"
  type        = set(string)
}

variable "public_subnet" {
  description = "ID de la subred pública"
  type        = string
}

variable "private_subnet" {
  description = "ID de la subred privada"
  type        = string
}

variable "ec2_specs" {
  description = "Especificaciones de EC2"
  type = object({
    ami           = string
    instance_type = string
  })
}

variable "default_ec2_specs" {
  description = "Valores por defecto para EC2"
  type = object({
    ami           = string
    instance_type = string
  })
  
  default = {
    ami           = "ami-0f3f13f145e66a0a3"
    instance_type = "t2.micro"
  }
}

variable "enable_monitoring" {
  description = "Habilita el despliegue del servidor de monitoreo"
  type        = bool
  default     = false
}

variable "project" {
  description = "Identificador del proyecto"
  type        = string
}

variable "suffix" {
  description = "Sufijo para los nombres de los recursos"
  type        = string
}

variable "common_tags" {
  description = "Etiquetas comunes aplicadas a los recursos"
  type        = map(string)
}
