resource "aws_iam_group" "group" {
  name = "group-${var.sufix}"
}

resource "aws_iam_group_policy_attachment" "group_policy" {
  group      = aws_iam_group.group.name
  policy_arn = var.policy_arn
}
