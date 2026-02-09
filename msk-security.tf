resource "aws_security_group" "msk" {
  name   = "${var.project}-msk-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    description = "Kafka TLS from inside VPC"
    from_port   = 9094
    to_port     = 9094
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-msk-sg"
  }
}
