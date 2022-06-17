resource "aws_alb" "terraform_alb" {
  subnets         = ["${aws_subnet.terraform_subnet1.id}", "${aws_subnet.terraform_subnet2.id}"]
  security_groups = ["${aws_security_group.terraform_sg.id}"]
  enable_http2    = "true"
  idle_timeout    = 600
}

resource "aws_alb_listener" "terraform_alb_listener" {
  load_balancer_arn = aws_alb.terraform_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    order = 1
    type  = "redirect"
    redirect {
      host        = "#{host}"
      path        = "/#{path}"
      port        = "443"
      protocol    = "HTTPS"
      query       = "#{query}"
      status_code = "HTTP_301"
    }
  }
}