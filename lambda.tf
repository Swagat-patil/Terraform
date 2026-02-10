resource "aws_lambda_function" "msk_consumer" {
  function_name = "msk-to-dynamo-opensearch"
  role          = aws_iam_role.aoss_readwrite.arn
  runtime       = "python3.11"
  handler       = "index.lambda_handler"

  filename         = "lambda-code/function.zip"
  source_code_hash = filebase64sha256("lambda-code/function.zip")

  timeout      = 30
  memory_size = 512

environment {
  variables = {
    DYNAMODB_TABLE      = aws_dynamodb_table.msk_events.name
    OPENSEARCH_ENDPOINT = aws_opensearchserverless_collection.this.collection_endpoint
  }
}
}
