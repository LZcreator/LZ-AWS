# ARN of the S3 bucket
output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.lz25_bucket.arn
}

# S3 bucket name
output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.lz25_bucket.bucket
}
