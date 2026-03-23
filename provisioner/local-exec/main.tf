resource "aws_instance" "ec2" {
  ami        = "ami-0b0b78dcacbab728f"
  instance_type = "t3.micro"
  tags = {
  Name = "EC2 server" 
  }

  provisioner "local-exec" {
    command = " echo ${self.public_ip} ${self.private_ip}"
    working_dir = "C:\\Users\\nikhi\\OneDrive\\Documents\\"
    when = destroy
  }
}

provider "aws" {
  region = "us-east-2"
}