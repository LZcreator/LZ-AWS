resource "aws_iam_group" "admin_group" {
  name = "admin-group-${var.sufix}"
}

resource "aws_iam_group_policy_attachment" "admin_policy_attachment" {
  group      = aws_iam_group.admin_group.name
  policy_arn = var.admin_policy_arn
}

resource "aws_iam_group" "logs_s3_group" {
  name = "logs-s3-group-${var.sufix}"
}

resource "aws_iam_group_policy_attachment" "logs_s3_policy_attachment" {
  group      = aws_iam_group.logs_s3_group.name
  policy_arn = var.logs_s3_policy_arn
}

resource "aws_iam_group" "infra_group" {
  name = "infra-group-${var.sufix}"
}

resource "aws_iam_group_policy_attachment" "infra_policy_attachment" {
  group      = aws_iam_group.infra_group.name
  policy_arn = var.infra_policy_arn
}

resource "aws_iam_group" "billing_group" {
  name = "billing-group-${var.sufix}"
}

resource "aws_iam_group_policy_attachment" "billing_policy_attachment" {
  group = aws_iam_group.billing_group.name
  policy_arn = var.billing_policy_arn
}