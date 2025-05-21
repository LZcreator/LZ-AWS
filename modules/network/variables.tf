variable "project" {
  description = "name of the project"
  type        = string
}

variable "common_tags" {
  description = "common tags"
  type        = map(string)
}

variable "sufix" {
  description = "sufix for the unique names"
  type        = string
}