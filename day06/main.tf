#all resource definitions
# 1. Define the required AWS provider and version


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
