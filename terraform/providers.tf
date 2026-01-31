provider "aws" {
  region = var.aws_region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket       = "btc-terraform-state-bucket-wyx"
    key          = "terraform/state/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true # Enable S3 native locking
  }
}