terraform {
  required_version = "~> 1.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.70.0"
    }
  }

  backend "s3" {
    bucket = "terraform-state-asfa8s7d6"
    key    = "devops/terraform.tfstate"
    region = "eu-west-1"

    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  # Configuration options
  region  = var.aws_region
  profile = var.profile
}