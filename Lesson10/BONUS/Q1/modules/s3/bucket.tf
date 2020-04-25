resource "aws_s3_bucket" "bucket" {
  bucket = var.s3_bucket_name
  acl    = var.s3_bucket_acl
  force_destroy = var.bucket_force_destry
  tags = {
    Name        = var.s3_bucket_name
  }

  versioning {
    enabled = true
  }
}