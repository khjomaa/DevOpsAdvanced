locals {
  bucket_name = "khalilj-terraform-states"
  bucket_acl  = "public-read"
  region = "us-east-1"
}

provider "aws" {
  region = local.region
  version = "~> 2.58"
}


module "bucket" {
  source = "../../modules/s3"
  bucket_name = local.bucket_name
  bucket_acl = local.bucket_acl
  bucket_force_destry = "true"
}

output "s3_bucket_arn" {
  value = module.bucket.arn
  description = "The ARN of the S3 bucket"
}