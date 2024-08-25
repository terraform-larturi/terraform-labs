output "server_public_ip" {
  description = "Direccion de IP publica de la instancia EC2"
  value       = aws_instance.nginx-server.public_ip
}

output "server_public_dns" {
  description = "DNS publico de la instancia EC2"
  value       = aws_instance.nginx-server.public_dns
}
