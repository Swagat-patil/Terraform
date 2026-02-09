variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project" {
  type    = string
  default = "dev-app"
}

variable "iam_principals" {
  description = "IAM users or roles allowed to access OpenSearch"
  type        = list(string)
}