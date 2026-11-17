

data "aws_vpc" "vpc_name" {
  filter {
    name = "tag:Name"
    values = ["my-first-vpc-vpc"]   
  }
}

resource "aws_subnet" "shared" {
  filter{
    name= "tag:Name"
    values=["my-first-vpc-subnet-private1-ap-south-1a"]
  }
  vpc_id = data.aws_vpc.vpc_name
}

data "aws_ami" "linux2"{
  most_recent = true
  owners = ["self"]
}

resource "aws_instance" "example"{
  ami = 
  instance_type = "t3.micro"
  subnet_id = 
  private_ip = 
  tags=var.default_tags
}



