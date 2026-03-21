module "ec2" {
  source = "./modules/ec2"
  ami_id = "ami-058f0cf1cc0bc26b3"
  instance_type = "t3.micro"
  name = "ec2-instance"
}

output "ec2_id" {
  value = module.ec2.instance_id
}