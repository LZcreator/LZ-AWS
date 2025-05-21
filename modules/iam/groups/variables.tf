variable "sufix" {
  description = "sufix for unique names"
  type        = string
}

variable "common_tags" {
  description = "common tags"
  type        = map(string)
}

variable "policy_arn" {
  description = "ARN of the policy"
  type        = string
}

variable "project" {
  description = "name of the project"
  type        = string
}
