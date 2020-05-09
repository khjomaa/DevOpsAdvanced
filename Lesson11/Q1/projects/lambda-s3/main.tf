locals {
  bucket_name = "khalilj-assets"
  bucket_acl  = "public-read"
  region = "us-east-1"
  s3_key = "app.zip"
}

provider "aws" {
  region = "us-east-1"
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

resource "aws_s3_bucket_object" "object" {
  bucket = local.bucket_name
  key = local.s3_key
  source = "./app.zip"
  depends_on = [module.bucket]
}

module "lambda" {
  source = "../../modules/lambda"
  function_name = "HelloWorldFunction"
  function_handler = "app.handler"
  function_runtime = "python3.7"
  function_s3_bucket = local.bucket_name
  function_s3_key = local.s3_key
  function_memory_size = 128
  function_depends_on = [aws_s3_bucket_object.object, module.lambda.iam_for_lambda]
}