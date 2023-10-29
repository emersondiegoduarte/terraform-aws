terraform {

  required_version = "~> 1.3"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.2"
    }
  }

  cloud {
    workspaces {
      name = "terraform-aws"
    }
  }
}

provider "aws" {
  region                   = "us-east-1"
}