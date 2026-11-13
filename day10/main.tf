resource "aws_instance" "example" {
  ami="ami-0d7b208dc5b0fe76a"
  count=var.instance_count
  instance_type = var.environment=="dev"?"t3.micro":"t3.small"
  tags = var.tags
}
resource "aws_security_group" "ingress_rule"{
  Name="sg"
  ingress=[]
  egress=[]
}