output "vpc_id" {
  description = "The VPC ID"
  value       = aws_vpc.this.id
}

output "public_subnet_id" {
  description = "The public subnet ID"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "The private subnet ID"
  value       = aws_subnet.private.id
}

output "nat_gateway_id" {
  description = "The NAT Gateway ID"
  value       = aws_nat_gateway.this.id
}
