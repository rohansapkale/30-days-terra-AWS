variable "aws_region" {
  description = "AWS region for the infrastructure"
  type        = string
  default     = "ap-south-1"
}
variable "aws-alb-project" {
  description = "Prefix for resource names"
  type        = string
  default     = "terraform-alb-lab"
}