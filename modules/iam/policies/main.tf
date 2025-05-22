resource "aws_iam_policy" "logs_s3_policy" {
  name        = "logs-s3-policy-${var.sufix}"
  description = "Política con acceso completo a S3 y CloudWatch Logs"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          # S3
          "s3:ListAllMyBuckets",
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:CreateBucket",
          "s3:DeleteBucket"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = [
          # CloudWatch Logs
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:GetLogEvents",
          "logs:DescribeLogStreams",
          "logs:DescribeLogGroups",
          "logs:DeleteLogGroup",
          "logs:DeleteLogStream"
        ],
        Resource = "*"
      }
    ]
  })

  tags = var.common_tags
}


 resource "aws_iam_policy" "admin_policy" {
  name        = "policy-admin-${var.sufix}"
  description = "Full admin access"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = "*",
      Resource = "*"
    }]
  })

  tags = var.common_tags
}

resource "aws_iam_policy" "infra_policy" {
  name        = "policy-infra-${var.sufix}"
  description = "Access to VPC, IAM and Budgets"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ec2:*",
          "iam:*",
          "budgets:*"
        ],
        Resource = "*"
      }
    ]
  })

  tags = var.common_tags
}
