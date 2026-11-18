output "instance_id" {
  description = "instance_id disponível para composição."
  value       = aws_instance.this.id
}
output "private_ip" {
  description = "private_ip disponível para composição."
  value       = aws_instance.this.private_ip
}
