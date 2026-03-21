variable "ami_id" {
  description = "Use to add ami id "
  type = string
  default = "ami-058f0cf1cc0bc26b3"
}

variable "instance_type" {
  description = "Use to add instance type"
  type = string
  default = "t3.micro"
}

variable "name" {
  description = "Use to add name to the resource"
  type = string
  default = "my-ec2-instance"
}