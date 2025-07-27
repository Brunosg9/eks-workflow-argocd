output "vpc_id" {
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "private_subnet_ids" {
  value       = [for subnet in aws_subnet.private : subnet.id]
}

output "public_route_table_ids" {
  value       = [for rt in aws_route_table.public : rt.id]
}

output "private_route_table_ids" {
  value       = [for rt in aws_route_table.private : rt.id]
}

output "security_group_id" {
  value       = aws_security_group.main.id
}