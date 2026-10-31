# 1. Define the required AWS provider and version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
variable "environment"{
  default="dev"
}
variable "region"{
  default = "ap-south-1"
}
locals{
  bucket = "${var.environment}-bucket-${var.region}"
  vpc= "${var.environment}-vpc-${var.region}"
}
# 2. Configure the AWS Provider and target region
provider "aws" {
  region = var.region
}

# 3. Create the S3 Bucket resource
resource "aws_s3_bucket" "my_bucket" {
  bucket = "" 

  tags = {
    Name        = "${var.environment}-Bucket"
    Environment = var.environment
  }
}
resource "aws_vpc" "dev_vpc"{
  cidr_block = "10.0.0.0/16"
  tags={
    Name = "${var.environment}-vpc"
    Environment=var.environment
  }
}
output "vpc_id" {
  value = aws_s3_bucket.my_bucket.id
}
output "s3_id"{
  value = aws_vpc.dev_vpc.id
}
