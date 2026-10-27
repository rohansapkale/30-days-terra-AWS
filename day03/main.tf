resource "aws_s3_bucket" "first-bucket" {
  bucket = "my-first-test-bucket-rohan-123"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
