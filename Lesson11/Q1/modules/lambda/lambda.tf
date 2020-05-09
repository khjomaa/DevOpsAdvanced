resource "aws_lambda_function" "my_func" {
  function_name = var.function_name
  handler = var.function_handler
  role = aws_iam_role.iam_for_lambda.arn
  runtime = var.function_runtime
  s3_bucket = var.function_s3_bucket
  s3_key = var.function_s3_key
  memory_size = var.function_memory_size
  depends_on = [var.function_depends_on]
}
