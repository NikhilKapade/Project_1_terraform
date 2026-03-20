resource "aws_instance" "manual" {
    ami = "ami-0b0b78dcacbab728f"
    instance_type = "t3.micro"
    tags = {
      Name= "demo1_manual"
    }
}

resource "aws_s3_bucket" "manual" {
  bucket = "sandman02"
}
