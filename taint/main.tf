provider "aws" {
  region = "us-east-2"
   alias = "us-east-2"
}

resource "aws_instance" "name" {
  ami = "ami-0b0b78dcacbab728f"
  instance_type = "t3.micro"
  provider = aws.us-east-2
  tags = {
    Name = "Nik"
  }
}