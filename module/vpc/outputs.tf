output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet" {
  value = { 
    web = aws_subnet.web[*].id
  }
}