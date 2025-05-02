output "web_instance_id_0" {
  description = "First web instance ID"
  value       = aws_instance.web_instance_id_0.id
}

output "web_instance_id_1" {
  description = "Second web instance ID"
  value       = aws_instance.web_instance_id_1.id
}
