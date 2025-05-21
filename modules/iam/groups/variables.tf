variable "sufix" {
  description = "Sufijo para nombres únicos"
  type        = string
}

variable "common_tags" {
  description = "Tags comunes para todos los recursos"
  type        = map(string)
}

variable "policy_arn" {
  description = "ARN de la política a adjuntar al grupo"
  type        = string
}

variable "project" {
  description = "Nombre del proyecto"
  type        = string
}
