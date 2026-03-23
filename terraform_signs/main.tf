resource "aws_instance" "ec2" {
  ami           = "ami-058f0cf1cc0bc26b3"
  instance_type = "t3.micro"
  tags = {
  Name = "EC2 server" 
  }
}

provider "aws" {
  region = "us-east-2"
}

output "instance_private_ip_address" {
  value = aws_instance.ec2.private_ip
}
output "instance_public_ip_address" {
  value = aws_instance.ec2.public_ip
}