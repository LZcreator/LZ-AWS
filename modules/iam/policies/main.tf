# IAM Policy providing full administrative access
resource "aws_iam_policy" "admin_policy" {
  name        = "admin-policy-${var.sufix}"
  description = "Full administrative access to all AWS resources"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = "*",       # Allows all AWS actions
      Resource = "*"      # Grants permissions to all resources
    }]
  })

  tags = var.common_tags
}

# IAM Policy providing full access to S3 and CloudWatch Logs
resource "aws_iam_policy" "logs_s3_policy" {
  name        = "logs-s3-policy-${var.sufix}"
  description = "Grants complete access to S3 buckets and CloudWatch Logs"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          # S3 permissions
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
          # CloudWatch Logs permissions
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

# IAM Policy providing access to manage EC2, VPC, and IAM resources
resource "aws_iam_policy" "infra_policy" {
  name        = "infra-policy-${var.sufix}"
  description = "Allows full management of EC2, VPC, and IAM resources"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ec2:*",     # Full EC2 permissions (including networking resources like VPC)
          "iam:*"      # Full IAM permissions
        ],
        Resource = "*"
      }
    ]
  })

  tags = var.common_tags
}

# IAM Policy providing access to AWS billing and budget services
resource "aws_iam_policy" "billing_policy" {
  name        = "billing-policy-${var.sufix}"
  description = "Allows access to billing, budgets, and cost explorer services"

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
          "budgets:*",   # Full permissions for AWS Budgets
          "ce:*"         # Full permissions for Cost Explorer
        ],
        Resource = ["*"]
      }
    ]
  })

  tags = var.common_tags
}