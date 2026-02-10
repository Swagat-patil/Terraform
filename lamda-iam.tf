# Allow Lambda to write logs
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.aoss_readwrite.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Allow Lambda to read from MSK
resource "aws_iam_role_policy" "lambda_msk_access" {
  name = "lambda-msk-access"
  role = aws_iam_role.aoss_readwrite.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "kafka:DescribeCluster",
          "kafka:GetBootstrapBrokers",
          "kafka:DescribeTopic",
          "kafka:DescribeGroup",
          "kafka:ReadData"
        ]
        Resource = "*"
      }
    ]
  })
}

# Allow Lambda to write to DynamoDB
resource "aws_iam_role_policy" "lambda_dynamodb_access" {
  name = "lambda-dynamodb-access"
  role = aws_iam_role.aoss_readwrite.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:PutItem",
          "dynamodb:UpdateItem",
          "dynamodb:GetItem"
        ]
        Resource = aws_dynamodb_table.msk_events.arn
      }
    ]
  })
}
