output "alb_dns_name" {
  description = "Public DNS name of the Application Load Balancer"
  value       = aws_lb.web.dns_name
}

output "ec2_instance_ids" {
  description = "IDs of the web instances"
  value       = aws_instance.web[*].id
}

output "target_group_arn" {
  description = "Target group ARN"
  value       = aws_lb_target_group.web.arn
}