output "vpc_id" {
  value = aws_vpc.main.id
}

output "web_subnet_ids" {
  value = aws_subnet.web[*].id
}