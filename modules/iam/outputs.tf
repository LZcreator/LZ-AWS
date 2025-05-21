output "iam_user_name" {
  value = module.user.iam_user_name
}

output "access_key_id" {
  value     = module.user.access_key_id
  sensitive = true
}

output "secret_access_key" {
  value     = module.user.secret_access_key
  sensitive = true
}
