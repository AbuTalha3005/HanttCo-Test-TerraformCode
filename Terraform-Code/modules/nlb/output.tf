output "nlb_dns" {
  description = "The DNS name of the Network Load Balancer"
  value       = aws_lb.nlb.dns_name
}

output "nlb_arn" {
  description = "The ARN of the Network Load Balancer"
  value       = aws_lb.nlb.arn
}
