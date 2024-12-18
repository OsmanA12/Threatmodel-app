output "alb_arn" {
 value = aws_lb.test.arn
}


output "target_group_arn" {
 value = aws_lb_target_group.test.arn
}

output "target_group_id" {
 value = aws_lb_target_group.test.id 
}


output "alb_listener" {
 value = aws_lb_listener.front_end.id 
}


output "alb_dns_name" {
 value = aws_lb.test.dns_name
}


output "https_listener" {
 value = aws_lb_listener.https-threatcomposer.id
}


