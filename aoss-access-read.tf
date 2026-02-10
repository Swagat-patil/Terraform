resource "aws_opensearchserverless_access_policy" "readonly" {
  name = "${local.collection_name}-readonly"
  type = "data"

  policy = jsonencode([
    {
      Description = "Read-only access to OpenSearch Serverless"
      Principal   = [aws_iam_role.aoss_readonly.arn]

      Rules = [
        {
          ResourceType = "collection"
          Resource     = ["collection/${local.collection_name}"]
          Permission   = [
            "aoss:DescribeCollectionItems"
          ]
        },
        {
          ResourceType = "index"
          Resource     = ["index/${local.collection_name}/*"]
          Permission   = [
            "aoss:ReadDocument"
          ]
        }
      ]
    }
  ])
}
