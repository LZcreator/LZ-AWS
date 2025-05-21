resource "aws_iam_policy" "custom_policy" {
  name        = "policy-${var.sufix}"
  description = "Policy with acceso to S3 y CloudWatch Logs"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "s3:ListBucket",
        "s3:GetObject",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      Resource = "*"
    }]
  })

  tags = var.common_tags
}
