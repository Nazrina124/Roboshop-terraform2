output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnets_id" {
  value = { 
    web = aws_subnet.web[*].id
  }
}