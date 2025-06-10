variable "project" {
  description = "name of the project"
  type        = string
}

variable "sufix" {
  type = string
}

variable "common_tags" {
  description = "common tags"
  type        = map(string)
}