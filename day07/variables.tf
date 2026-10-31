#Declare all inp variables
variable "environment" {
  default = "dev"
  type    = string
}
variable "region" {
  default = "ap-south-1"
  type    = string
}
variable "instance_count" {
  description = "No. of EC2 Instances to create"
  type        = number
}
variable "most_recent" {
  type = bool
}
variable "monitoring_val" {
  type = bool
}
variable "associate_public_ip_address" {
  type        = bool
  description = "Associate public ip address with EC2 instances"
  default     = true
}
variable "cidr_block" {
  type    = list(string)
  default = ["10.0.0.0/8", "192.168.0.0/16", "172.16.0.0/12"]
}
variable "instance_type" {
  description = "Instance types of ec2 instances"
  type        = list(string)
  default     = ["t3.micro", "t2.micro"]
}
