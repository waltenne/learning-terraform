output "public_ip" {
  value       = aws_instance.terraform_instance.public_ip
  description = "IP Publico"
}

output "public_dns" {
  value       = aws_instance.terraform_instance.public_dns
  description = "DNS Publico"
}