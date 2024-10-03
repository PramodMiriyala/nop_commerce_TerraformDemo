terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.69.0"
    }
  }
  backend "s3" {
    bucket         = "t-state"
    key            = "data/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "t-table"
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}
