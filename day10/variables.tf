#Declare all inp variables
variable "environment" {
  default = "dev"
}
variable "region" {
  default = "ap-south-1"
}
variable "instance_type" {
  type    = list(string)
  default = ["t3.micro", "t3.small"]
}
variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Name        = "dev-Instance"
    created_by  = "terraform"
    Compliance  = "yes"
  }
}
variable "instance_count" {
  type        = number
  description = "No.of EC2 instances to create"
}
variable "ingress_rule"{
  type=list(object({
    from_port=number
    to_port=number
    protocol = string
    cidr_blocks=list(string)
    description=string
  }))
  default=[{
    from_port=80
    to_port=80
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
    description="HTTP"
  },
  {
    from_port=443
    to_port=443
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
    description="HTTPS"
  }
  ]
}