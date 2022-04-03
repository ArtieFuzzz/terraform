output "instance_public_dns" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.server.public_dns
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.server.id
}

output "key_pair" {
  description = "The key pair that is currently being used"
  value = aws_instance.server.key_name
}

output "instance_type" {
  description = "The type the instance is"
  value = aws_instance.server.instance_type
}
