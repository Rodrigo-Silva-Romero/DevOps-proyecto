terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Invocar módulo ECR
module "ecr" {
  source          = "./ecr"
  ecr_repositories = var.ecr_repositories
}

# Invocar módulo S3
module "s3" {
  source      = "./s3"
  bucket_name = var.bucket_name
}

