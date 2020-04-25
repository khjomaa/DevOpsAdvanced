locals {
  bucket_name = "khalil-helm-central-bucket"
  bucket_acl  = "private"
  region = "us-east-1"
}

provider "aws" {
  region = local.region
  version = "~> 2.58"
}

module "bucket" {
  source         = "../../modules/S3"
  s3_bucket_name = local.bucket_name
  s3_bucket_acl  = local.bucket_acl
  bucket_force_destry = "true"
}

output "s3_bucket_arn" {
  value = module.bucket.arn
  description = "The ARN of the S3 bucket"
}

resource "aws_s3_bucket_object" "object" {
  bucket = local.bucket_name
  key = "charts/index.yaml"
  acl = local.bucket_acl
  source = "files/index.yaml"
  etag = filemd5("files/index.yaml")
}