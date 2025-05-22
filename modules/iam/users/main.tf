resource "aws_iam_user" "logs_s3_user" {
  name = "logs-s3-user-${var.sufix}"
  tags = var.common_tags
}

resource "aws_iam_user_group_membership" "logs_s3_membership" {
  user   = aws_iam_user.logs_s3_user.name
  groups = [var.logs_s3_group_name]
}

resource "aws_iam_access_key" "logs_s3_access_key" {
  user = aws_iam_user.logs_s3_user.name
}

resource "aws_iam_user" "admin_user" {
  name = "admin-user-${var.sufix}"
  tags = var.common_tags
}

resource "aws_iam_user_group_membership" "admin_membership" {
  user   = aws_iam_user.admin_user.name
  groups = [var.admin_group_name]
}

resource "aws_iam_access_key" "admin_access_key" {
  user = aws_iam_user.admin_user.name
}

resource "aws_iam_user" "infra_user" {
  name = "infra-user-${var.sufix}"
  tags = var.common_tags
}

resource "aws_iam_user_group_membership" "infra_membership" {
  user   = aws_iam_user.infra_user.name
  groups = [var.infra_group_name]
}

resource "aws_iam_access_key" "infra_access_key" {
  user = aws_iam_user.infra_user.name
}