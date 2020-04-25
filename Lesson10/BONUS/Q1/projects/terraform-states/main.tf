locals {
  bucket_name = "khalilj-terraform-states"
  bucket_acl  = "public-read"
  region = "us-east-1"
}

provider "aws" {
  region = local.region
  version = "~> 2.58"
}

module "dynamodb" {
  source        = "../../modules/dynamodb"
  hash_key      = "LockID"
  hash_key_type = "S"
  table_name    = "terraform-locks"
}

module "bucket" {
  source         = "../../modules/s3"
  s3_bucket_name = local.bucket_name
  s3_bucket_acl  = local.bucket_acl
  bucket_force_destry = "true"
}

output "dynamodb_table_name" {
  value = module.dynamodb.table-name
  description = "The name of the DynamoDB table"
}

output "dynamodb_table_arn" {
  value = module.dynamodb.table-arn
  description = "The ARN of the DynamoDB table"
}

output "s3_bucket_arn" {
  value = module.bucket.arn
  description = "The ARN of the S3 bucket"
}