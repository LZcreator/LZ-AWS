variable "project"           { type = string }
variable "sufix"             { type = string }
variable "common_tags"       { type = map(string) }

variable "logs_s3_group_name"  { type = string }
variable "admin_group_name"    { type = string }
variable "infra_group_name"    { type = string }
variable "billing_group_name" { type = string }