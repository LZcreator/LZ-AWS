# Create IAM group for administrators
resource "aws_iam_group" "admin_group" {
  name = "admin-group-${var.sufix}"
}

# Attach the administrative policy to the admin group
resource "aws_iam_group_policy_attachment" "admin_policy_attachment" {
  group      = aws_iam_group.admin_group.name
  policy_arn = var.admin_policy_arn
}

# Create IAM group for users requiring access to S3 and CloudWatch Logs
resource "aws_iam_group" "logs_s3_group" {
  name = "logs-s3-group-${var.sufix}"
}

# Attach the S3 and CloudWatch Logs access policy to the logs_s3 group
resource "aws_iam_group_policy_attachment" "logs_s3_policy_attachment" {
  group      = aws_iam_group.logs_s3_group.name
  policy_arn = var.logs_s3_policy_arn
}

# Create IAM group for infrastructure management roles
resource "aws_iam_group" "infra_group" {
  name = "infra-group-${var.sufix}"
}

# Attach the infrastructure management policy to the infra group
resource "aws_iam_group_policy_attachment" "infra_policy_attachment" {
  group      = aws_iam_group.infra_group.name
  policy_arn = var.infra_policy_arn
}

# Create IAM group for users managing billing and budgets
resource "aws_iam_group" "billing_group" {
  name = "billing-group-${var.sufix}"
}

# Attach the billing and budget management policy to the billing group
resource "aws_iam_group_policy_attachment" "billing_policy_attachment" {
  group      = aws_iam_group.billing_group.name
  policy_arn = var.billing_policy_arn
}