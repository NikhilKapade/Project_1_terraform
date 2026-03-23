provider "aws" {
  region = "us-east-2"
}

resource "aws_key_pair" "name" {
  key_name = "remote_key"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_instance" "name" {
  ami = "ami-0b0b78dcacbab728f"
  instance_type = "t3.micro"
  key_name = aws_key_pair.name.key_name
  tags = {
  Name = "EC2 server" 
  }

  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = file("~/.ssh/id_ed25519")
  }

  provisioner "file" {
    source = "C:\\Users\\nikhi\\Downloads\\index.html"
    destination = "/tmp/index.html"
  }

  provisioner "remote-exec" {
    inline = [ 
        "sudo yum install -y nginx",
        "sudo systemctl start nginx",
        "sudo systemctl enable nginx",
        "sudo mv /tmp/index.html /usr/share/nginx/html/index.html",
     ]
  }
}

output "public_ip" {
  value = aws_instance.name.public_ip
}

output "private_ip" {
  value = aws_instance.name.private_ip
}