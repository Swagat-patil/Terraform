
output "msk_bootstrap_brokers_tls" {
  value = aws_msk_cluster.this.bootstrap_brokers_tls
}

output "msk_cluster_name" {
  value = aws_msk_cluster.this.cluster_name
}

output "opensearch_serverless_endpoint" {
  value = aws_opensearchserverless_collection.this.collection_endpoint
}

output "opensearch_serverless_dashboard_url" {
  value = aws_opensearchserverless_collection.this.dashboard_endpoint
}

output "aoss_readonly_role_arn" {
  value = aws_iam_role.aoss_readonly.arn
}

output "aoss_readwrite_role_arn" {
  value = aws_iam_role.aoss_readwrite.arn
}
