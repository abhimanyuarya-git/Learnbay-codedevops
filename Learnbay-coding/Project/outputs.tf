output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = aws_subnet.private[*].id
}

output "web_instance_ids" {
  description = "Web server instance IDs"
  value       = aws_instance.web[*].id
}

output "web_instance_public_ips" {
  description = "Web server public IPs"
  value       = aws_instance.web[*].public_ip
}