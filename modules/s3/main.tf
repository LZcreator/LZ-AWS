# Creates an AWS S3 bucket using the specified bucket name from variables
resource "aws_s3_bucket" "lz25_bucket" {
  bucket        = var.bucket_name
  force_destroy = true  # Allows bucket deletion even if it has objects
}

# Enables bucket versioning, conditionally based on `enable_versioning`
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.lz25_bucket.id
  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}
