output "rds_sg_id" {
  value = aws_security_group.rds-sg.id
}

output "web_sg_id" {
  value = aws_security_group.web-sg.id
}