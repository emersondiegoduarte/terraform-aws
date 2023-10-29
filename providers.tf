terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region                   = "us-east-1"
  access_key = "AKIAR73XG2I23OWYBYEZ"
  secret_key = "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"
}