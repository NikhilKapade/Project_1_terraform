output "VPC_ID" {
  value = aws_vpc.name.id
  }

output "subnet1_ID" {
  value = aws_subnet.name1.id
  }


output "subnet2_ID" {
  value = aws_subnet.name2.id
}

output "IG_ID" {
  value = aws_internet_gateway.name.id
}

output "IG_name" {
  value = aws_internet_gateway.name
}

output "RT1_ID" {
  value = aws_route_table.name1.id
}


output "RT2_ID" {
  value = aws_route_table.name2.id
}


output "nat_gateway_ID" {
  value = aws_nat_gateway.name.id
}


output "Security_Group_ID" {
  value = aws_security_group.public_sg.id
}

output "EC2_instance_ID" {
  value = aws_instance.name.id
}



