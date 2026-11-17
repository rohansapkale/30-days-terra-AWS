output "website_url" {
  description = "Public URL for S3 Static Website"
  value       = "http://${aws_s3_bucket_website_configuration.website.website_endpoint}"
}