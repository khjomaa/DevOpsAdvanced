resource "aws_dynamodb_table" "table" {
  name = var.table_name
  read_capacity = 5
  write_capacity = 5
  hash_key = var.hash_key

  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }

  billing_mode = var.billing_mode
}

