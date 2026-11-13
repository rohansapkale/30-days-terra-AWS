#Declare all inp variables
variable "environment" {
  default = "dev"
}
variable "region" {
  default = "ap-south-1"
}
variable "bucket_names" {
  description = "name of the s3 buckets"
  type        = list(string)
  default     = ["my-unique-bucket-r1234", "my-unique-bucket-r1124", "my-unique-bucket-r2124"]
}
variable "bucket_names_set" {
  description = "name of the s3 buckets"
  type        = set(string)
  default     = ["my-unique-bucket-1r234-2", "my-unique-bucket-r1124-2", "my-unique-bucket-r2124-2"]
}
variable "Allowed_instance_type" {
   description = "types of ec2 instances"
  type        = list(string)
  default     = ["t3.micro", "t2.micro"]
}
