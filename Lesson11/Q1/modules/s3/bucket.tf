resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = var.bucket_acl
  force_destroy = var.bucket_force_destry
  versioning {
    enabled = true
  }
}