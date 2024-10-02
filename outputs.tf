output "frontend_load_balancer_dns" {
  description = "DNS of the frontend load balancer"
  value       = aws_lb.frontend_load_balancer.dns_name
}

output "backend_load_balancer_dns" {
  description = "DNS of the backend load balancer"
  value       = aws_lb.backend_load_balancer.dns_name
}

