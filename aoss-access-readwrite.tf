resource "aws_opensearchserverless_access_policy" "readwrite" {
  name = "${local.collection_name}-readwrite"
  type = "data"

  policy = jsonencode([
    {
      Description = "Read-write access to OpenSearch Serverless"
      Principal   = [aws_iam_role.aoss_readwrite.arn]

      Rules = [
        {
          ResourceType = "collection"
          Resource     = ["collection/${local.collection_name}"]
          Permission   = ["aoss:*"]
        },
        {
          ResourceType = "index"
          Resource     = ["index/${local.collection_name}/*"]
          Permission   = ["aoss:*"]
        }
      ]
    }
  ])
}
