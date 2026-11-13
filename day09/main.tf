# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# Fetch the latest Ubuntu 24.04 LTS AMI in Mumbai
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Create the EC2 Instance
resource aws_instance "instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.Allowed_instance_type[0]
    tags ={
    Name = "My-EC2-instance-${var.region}"
    Environment=var.environment
  }
  lifecycle {
    create_before_destroy = true
  }
}

