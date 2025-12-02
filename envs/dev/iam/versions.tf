terraform {
  required_version = "~> 1.13.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  cloud {
    organization = "kube-rca"

    workspaces {
      name = "iam"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
