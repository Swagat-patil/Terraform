resource "aws_opensearchserverless_collection" "this" {
  name = local.collection_name
  type = "SEARCH"

  depends_on = [
    aws_opensearchserverless_security_policy.encryption,
    aws_opensearchserverless_security_policy.network
  ]

  tags = {
    Environment = "dev"
    Project     = var.project
  }
}
