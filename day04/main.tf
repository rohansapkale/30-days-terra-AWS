terraform {
    backend "s3" {
    bucket = "my-first-bucket-rohan-097"
    key    = "dev/terraform.tf.state"
    region = "ap-south-1"
    encrypt = true
    
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
#create s3 bucket
resource "aws_s3_bucket" "first_bucket"{
  bucket = "terraform-bucket-rohan-097"
  tags = {
    Name= "My bucket 2.0"
    Environment="Dev"
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

