resource "aws_iam_user" "user" {
  name = "user-${var.sufix}"
  tags = var.common_tags
}

resource "aws_iam_user_group_membership" "membership" {
  user   = aws_iam_user.user.name
  groups = [var.group_name]
}

resource "aws_iam_access_key" "access_key" {
  user = aws_iam_user.user.name
}
