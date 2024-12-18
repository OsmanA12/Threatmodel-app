# ALB




resource "aws_lb" "test" {
name               = "threatcomposer-alb"
internal           = false
load_balancer_type = "application"
security_groups    = [var.security_group_id]
subnets            = var.subnet_ids
enable_deletion_protection = false

}




# Target group ALB




resource "aws_lb_target_group" "test" {
name     = "threatcomposer-tg"
port     = 3000
protocol = "HTTP"
vpc_id   = var.vpc_id
target_type = "ip"
}






#ALB listener HTTP
resource "aws_lb_listener" "front_end" {
load_balancer_arn = aws_lb.test.arn
port              = "80"
protocol          = "HTTP"








default_action {
  type             = "redirect"
  target_group_arn = aws_lb_target_group.test.arn
 redirect {
    port        = "443"
    protocol    = "HTTPS"
    status_code = "HTTP_301"
  }
}
}






#ALB HTTPs Listener


resource "aws_lb_listener" "https-threatcomposer" {
 load_balancer_arn = aws_lb.test.arn
 port              = "443"
 protocol          = "HTTPS"
 ssl_policy        = var.ssl_policy
 certificate_arn   = var.certificate_arn


 default_action {
   type             = "forward"
   target_group_arn = aws_lb_target_group.test.arn
 }
}
