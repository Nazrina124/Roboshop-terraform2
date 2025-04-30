output "dns_name"{
    value = aws_lb.main.dns_name

}

output "listner_arn"{
    value = aws_lb_listener.main

}