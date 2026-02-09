resource "aws_opensearchserverless_access_policy" "access" {
  name = "${local.collection_name}-access"
  type = "data"

  policy = jsonencode([
    {
      Description = "Access for IAM users and Glenraven roles"
      Principal   = var.iam_principals

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
