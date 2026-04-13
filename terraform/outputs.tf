output "public_ip" {
  value = aws_instance.self_healing_instance.public_ip
}