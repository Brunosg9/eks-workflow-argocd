provider "aws" {
  region = "us-east-1"  # ajuste para sua região
}

# Bucket S3 - já criado manualmente no console
data "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "github-s3-terraform-tfstate"
}

# Tabela DynamoDB para locking do Terraform state
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform Lock Table"
    Environment = "prd"
  }
}

terraform {
  backend "s3" {
    bucket         = "github-s3-terraform-tfstate"
    key            = "vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
