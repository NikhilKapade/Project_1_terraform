resource "tls_private_key" "name" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "name" {
  key_name = "xfusion-kp"
  public_key = tls_private_key.name.public_key_openssh
}

resource "local_file" "name" {
  content = aws_key_pair.name.public_key
  filename = "/home/bob/xfusion-kp.pub"
  file_permission = "400"
}