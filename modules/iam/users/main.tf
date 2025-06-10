# IAM User with administrative privileges
resource "aws_iam_user" "admin_user" {
  name = "admin-user-${var.sufix}"
  tags = var.common_tags
}

# Assigns the admin user to the Admin IAM group
resource "aws_iam_user_group_membership" "admin_membership" {
  user   = aws_iam_user.admin_user.name
  groups = [var.admin_group_name]
}

# Creates an access key for the admin user (for programmatic access)
resource "aws_iam_access_key" "admin_access_key" {
  user = aws_iam_user.admin_user.name
}

# IAM User with access to S3 and CloudWatch Logs
resource "aws_iam_user" "logs_s3_user" {
  name = "logs-s3-user-${var.sufix}"
  tags = var.common_tags
}

# Assigns the logs_s3 user to the Logs S3 IAM group
resource "aws_iam_user_group_membership" "logs_s3_membership" {
  user   = aws_iam_user.logs_s3_user.name
  groups = [var.logs_s3_group_name]
}

# Creates an access key for the logs_s3 user (for programmatic access)
resource "aws_iam_access_key" "logs_s3_access_key" {
  user = aws_iam_user.logs_s3_user.name
}

# IAM User with access to infrastructure services (EC2, VPC, IAM)
resource "aws_iam_user" "infra_user" {
  name = "infra-user-${var.sufix}"
  tags = var.common_tags
}

# Assigns the infra user to the Infra IAM group
resource "aws_iam_user_group_membership" "infra_membership" {
  user   = aws_iam_user.infra_user.name
  groups = [var.infra_group_name]
}

# Creates an access key for the infra user (for programmatic access)
resource "aws_iam_access_key" "infra_access_key" {
  user = aws_iam_user.infra_user.name
}

# IAM User with access to AWS billing services
resource "aws_iam_user" "billing_user" {
  name = "billing-user-${var.sufix}"
  tags = var.common_tags
}

# Assigns the billing user to the Billing IAM group
resource "aws_iam_user_group_membership" "billing_membership" {
  user   = aws_iam_user.billing_user.name
  groups = [var.billing_group_name]
}

# Creates an access key for the billing user (for programmatic access)
resource "aws_iam_access_key" "billing_access_key" {
  user = aws_iam_user.billing_user.name
}