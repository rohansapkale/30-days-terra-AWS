#define what info to display after terraform apply
output "vpc_id" {
  value = aws_s3_bucket.my_bucket.id
}
output "s3_id"{
  value = aws_vpc.dev_vpc.id
}
