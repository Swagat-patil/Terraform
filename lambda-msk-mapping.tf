resource "aws_lambda_event_source_mapping" "msk_event" {
  event_source_arn = aws_msk_cluster.this.arn
  function_name    = aws_lambda_function.msk_consumer.arn

  topics = ["demo-topic"]
  starting_position = "LATEST"

  batch_size = 100
  enabled    = true
}
