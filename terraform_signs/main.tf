resource "aws_instance" "ec2" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  tags = {
    Name= "Bastion host"
  }
}

provider "aws" {
  region = "us-east-2"
}