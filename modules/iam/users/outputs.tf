output "admin_user_name" {
  value = aws_iam_user.admin_user.name
}

output "admin_access_key_id" {
  value     = aws_iam_access_key.admin_access_key.id
  sensitive = true
}

output "admin_secret_access_key" {
  value     = aws_iam_access_key.admin_access_key.secret
  sensitive = true
}

output "logs_s3_user_name" {
  value = aws_iam_user.logs_s3_user.name
}

output "logs_s3_access_key_id" {
  value     = aws_iam_access_key.logs_s3_access_key.id
  sensitive = true
}

output "logs_s3_secret_access_key" {
  value     = aws_iam_access_key.logs_s3_access_key.secret
  sensitive = true
}

output "infra_user_name" {
  value = aws_iam_user.infra_user.name
}

output "infra_access_key_id" {
  value     = aws_iam_access_key.infra_access_key.id
  sensitive = true
}

output "infra_secret_access_key" {
  value     = aws_iam_access_key.infra_access_key.secret
  sensitive = true
}

output "billing_user_name" {
  value = aws_iam_user.billing_user.name
}

output "billing_access_key_id" {
  value     = aws_iam_access_key.billing_access_key.id
  sensitive = true
}

output "billing_secret_access_key" {
  value     = aws_iam_access_key.billing_access_key.secret
  sensitive = true
}