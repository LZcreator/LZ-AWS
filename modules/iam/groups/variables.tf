variable "sufix"       { type = string }
variable "project"     { type = string }
variable "common_tags" { type = map(string) }

variable "logs_s3_policy_arn" { type = string }
variable "admin_policy_arn"   { type = string }
variable "infra_policy_arn"   { type = string }