output "vpc_id" {
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "private_subnet_ids" {
  value       = [for subnet in aws_subnet.private : subnet.id]
}

output "public_route_table_ids" {
  value       = [aws_route_table.public.id]
}

output "private_route_table_ids" {
  value       = [data.aws_route_table.private.id]
}

output "security_group_id" {
  value       = aws_security_group.this.id
}