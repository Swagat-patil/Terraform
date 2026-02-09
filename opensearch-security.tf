resource "aws_security_group" "opensearch" {
  name   = "${var.project}-opensearch-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    description = "HTTPS from inside VPC only"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
