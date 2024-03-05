resource "aws_dynamodb_table" "order_queue" {
  name           = "TC04-Queue"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key = "id"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "order_id"
    type = "N"
  }

  global_secondary_index {
    name               = "index"
    hash_key           = "id"
    projection_type    = "ALL"
    read_capacity      = 5
    write_capacity     = 5
  }

  global_secondary_index {
    name               = "index_type"
    hash_key           = "order_id"
    projection_type    = "ALL"
    read_capacity      = 5
    write_capacity     = 5
  }
}