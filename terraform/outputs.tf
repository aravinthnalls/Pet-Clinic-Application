output "instance_ip" {
  value       = aws_instance.example_service_ai_pipeline.public_ip
  description = "Public IP of the application host"
}

output "instance_id" {
  value       = aws_instance.example_service_ai_pipeline.id
  description = "EC2 instance id"
}

output "security_group_id" {
  value       = aws_security_group.app.id
  description = "Security group attached to the application host"
}

output "application_url" {
  value       = "http://${aws_instance.example_service_ai_pipeline.public_ip}:${var.app_port}"
  description = "Application URL"
}
