# Creates an AWS S3 bucket using the specified bucket name from variables.
resource "aws_s3_bucket" "lz25_bucket" {
  bucket = var.bucket_name
  force_destroy = true  # Allows destroy the bucket, even if it has objects in it.
}

# Enables bucket versioning, in case of modifications or deletions
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.lz25_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

