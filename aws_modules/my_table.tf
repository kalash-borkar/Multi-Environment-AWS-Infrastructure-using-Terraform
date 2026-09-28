# DynamoDB Table

resource "aws_dynamodb_table" "example" {
  name           = "${var.my_env}-dynamo_table_name"
  billing_mode   = "PAY_PER_REQUEST"   # On-demand capacity (no need to set RCU/WCU)
  hash_key       = "id"        # Partition Key
  attribute {
    name = "id"
    type = "S"
  }
}