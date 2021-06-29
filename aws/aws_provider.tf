terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  region                  = var.region
  shared_credentials_file = "$HOME/.aws/credentials"
  profile                 = "fortinet"

  # There are multiple ways to authenticate
  # Check the provider docs to determine which
  # is the best for your environment
  #access_key = var.access_key
  #secret_key = var.secret_key
}