# 1. Define the required AWS provider and version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# 2. Configure the AWS Provider and target region
provider "aws" {
  region = "ap-south-1"
}

# 3. Create the S3 Bucket resource
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-ubuntu-managed-bucket-2026" # Replace with a globally unique name

  tags = {
    Name        = "My Ubuntu S3 Bucket"
    Environment = "Dev"
  }
}

