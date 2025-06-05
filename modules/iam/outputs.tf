output "logs_s3_user_name" {
  value = module.user.logs_s3_user_name
}

output "logs_s3_access_key_id" {
  value     = module.user.logs_s3_access_key_id
  sensitive = true
}

output "logs_s3_secret_access_key" {
  value     = module.user.logs_s3_secret_access_key
  sensitive = true
}

output "admin_user_name" {
  value = module.user.admin_user_name
}

output "infra_user_name" {
  value = module.user.infra_user_name
}
