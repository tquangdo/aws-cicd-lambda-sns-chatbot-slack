provider "aws" {
  region  = "us-east-1"
}

locals {
  s3_origin_id = "access-identity-serverless-series-spa"
  region       = "us-east-1"
}

data "aws_caller_identity" "current" {}

data "aws_canonical_user_id" "current" {}

output "base_url" {
  value = {
    api_staging    = aws_api_gateway_deployment.staging.invoke_url
    api_production = aws_api_gateway_deployment.production.invoke_url
  }
}
