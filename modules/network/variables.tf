variable "project" {
  description = "Nombre del proyecto"
  type        = string
}

variable "common_tags" {
  description = "Tags comunes para todos los recursos"
  type        = map(string)
}

variable "sufix" {
  description = "Sufijo para nombres únicos"
  type        = string
}