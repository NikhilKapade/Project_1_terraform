
provider "aws" {
 region= "us-east-2" 
}

variable "ec2" {
  default = ["dev", "prod"]
}

resource "aws_instance" "name" {
  ami = "ami-058f0cf1cc0bc26b3"
  instance_type = "t3.micro"
  key_name = aws_key_pair.name.key_name
  count = length(var.ec2)
  tags = {
    Name= var.ec2[count.index]
  }
}

resource "tls_private_key" "name" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "name" {
  key_name = "NikWindows"
  public_key = tls_private_key.name.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.name.private_key_pem
  filename = "NikWindows.pem"
}