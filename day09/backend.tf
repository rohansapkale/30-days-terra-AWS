#Configure where terraform stores state files
terraform {
  backend "s3" {
    bucket  = "my-first-bucket-rohan-097"
    key     = "dev/terraform.tf.state"
    region  = "ap-south-1"
    encrypt = true
  }
}
