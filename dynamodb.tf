resource "aws_dynamodb_table" "msk_events" {
  name         = "msk-events-table"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "event_id"

  attribute {
    name = "event_id"
    type = "S"
  }

  tags = {
    Project = var.project
  }
}
