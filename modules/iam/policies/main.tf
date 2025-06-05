# admin policy
resource "aws_iam_policy" "admin_policy" {
  name        = "admin-policy-${var.sufix}"
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

# policy for for logs
resource "aws_iam_policy" "logs_s3_policy" {
  name        = "logs-s3-policy-${var.sufix}"
  description = "Policy with complete access to S3 and CloudWatch Logs"

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

# policy for the acess to the infrastructure
resource "aws_iam_policy" "infra_policy" {
  name        = "infra-policy-${var.sufix}"
  description = "Access to Ec2, Vps, IAM"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ec2:*",
          "iam:*",
        ],
        Resource = "*"
      }
    ]
  })

  tags = var.common_tags
}

# Policy for the billing group
resource "aws_iam_policy" "billing_policy" {
  name        = "billing-policy-${var.sufix}"
  description = "Access to billing"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "aws-portal:ViewBilling",
          "aws-portal:ViewAccount",
          "aws-portal:ViewUsage",
          "aws-portal:ViewPaymentMethods",
          "budgets:*",
          "ce:*"
        ],
        Resource = ["*"]
      }
    ]
  })

  tags = var.common_tags
}
