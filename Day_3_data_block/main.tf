data "aws_ami" "name" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

output "ami_id" {
  value = data.aws_ami.name.id
}