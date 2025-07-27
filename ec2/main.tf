terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 6.4"
        }
    }
}

provider "aws" {
  assume_role {
    role_arn = var.assume_role_arn
  }
}