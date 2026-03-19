resource "aws_instance" "server" {
  
  ami = "ami-0b0b78dcacbab728f"
  instance_type = var.my_EC2_INSTANCE
  key_name="terraform1"
 vpc_security_group_ids = ["sg-0ade33fcd0f4bf4a4"]
 
 tags = {
    Name= "Terra1"
 }

}