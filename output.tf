output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.server.public_ip
}

output "instance_private_ip" {
  description = "Private IP of EC2 instance"
  value       = aws_instance.server.private_ip
}

output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.server.id
}