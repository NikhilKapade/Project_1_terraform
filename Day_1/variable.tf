variable "vpc_name" {
   description = "Used for VPC name"
   type = string
}

variable "subnet1_name" {
   description = "Used for public name"
   type = string
}

variable "subnet2_name" {
   description = "Used for private name"
   type = string
}

variable "IG_name" {
  description = "Used for IG name"
  type = string
}

variable "RT1_name" {
  description = "Used as public route table"
  type = string
}

variable "RT2_name" {
  description = "Used as private route table"
  type = string
}

variable "nat_gateway_name" {
  description = "Used for nat gateway name"
  type = string 
}

variable "instance_name1" {
  description = "Used for EC2 instance name"
  type = string
}


