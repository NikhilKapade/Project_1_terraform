# network creation
# VPC creation
resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name= var.vpc_name
  }
}

# subnet creation
resource "aws_subnet" "name1" {
  vpc_id = aws_vpc.name.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name= var.subnet1_name
  }
}

# subnet creation
resource "aws_subnet" "name2" {
  vpc_id = aws_vpc.name.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2b"
  tags = {
    Name= var.subnet2_name
  }
}

# internet gateway creation
resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name= var.IG_name
  }
}

# public route table creation
resource "aws_route_table" "name1" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name= var.RT1_name
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
  }
}

# eip creation
resource "aws_eip" "name" {
  domain = "vpc"
}

# nat gateway creation
resource "aws_nat_gateway" "name" {
  availability_mode = "zonal"
  subnet_id = aws_subnet.name1.id
  allocation_id = aws_eip.name.id
  tags = {
    Name= var.nat_gateway_name
  }
}

# private route table creation
resource "aws_route_table" "name2" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name= var.RT2_name
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.name.id
  }
}

# route table association for public subnet
resource "aws_route_table_association" "name1" {
  subnet_id = aws_subnet.name1.id
  route_table_id = aws_route_table.name1.id
}

# route table association for private subnet
resource "aws_route_table_association" "name2" {
  subnet_id = aws_subnet.name2.id
  route_table_id = aws_route_table.name2.id
}

# EC2 instance creation
resource "aws_instance" "name" {
  ami = "ami-0b0b78dcacbab728f"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.name1.id
  tags = {
    Name= var.instance_name1
  }
  security_groups = [ aws_security_group.public_sg.id ]
}

# security group creation
resource "aws_security_group" "public_sg" {
  description = "Allow SSH inbound traffic"
  vpc_id = aws_vpc.name.id
  ingress {
    description = "Allow SSH inbound traffic"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}