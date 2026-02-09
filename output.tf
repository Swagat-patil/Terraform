output "opensearch_endpoint" {
  value = aws_opensearch_domain.this.endpoint
}

output "msk_bootstrap_brokers_tls" {
  value = aws_msk_cluster.this.bootstrap_brokers_tls
}

output "msk_cluster_name" {
  value = aws_msk_cluster.this.cluster_name
}
