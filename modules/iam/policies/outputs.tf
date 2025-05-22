output "policy_arn" {
  value = aws_iam_policy.logs_s3_policy.arn
}

output "admin_policy_arn" {
  value = aws_iam_policy.admin_policy.arn
}

output "infra_policy_arn" {
  value = aws_iam_policy.infra_policy.arn
}
