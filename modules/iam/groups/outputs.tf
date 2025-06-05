output "admin_group_name" {
  value = aws_iam_group.admin_group.name
}

output "logs_s3_group_name" {
  value = aws_iam_group.logs_s3_group.name
}

output "infra_group_name" {
  value = aws_iam_group.infra_group.name
}

output "billing_group_name" {
  value = aws_iam_group.billing_group.name
}

