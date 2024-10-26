# Application Load balancer

resource "aws_lb" "vault_lb" {
    name = "vault-lb"
    internal = false
    load_balancer_type = "application"
    security_groups = [ aws_security_group.vault_lb_sg.id ]
    subnets = var.subnet_ranges

}



resource "aws_alb_target_group" "vault_alb_tg" {
  name = "vault-alb-tg"
  target_type = "instance"
  protocol = "HTTP"
  port = 8200
  vpc_id = var.vpc_id
  health_check {
    healthy_threshold = 5
    unhealthy_threshold = 2
    timeout = 5
    interval = 30
    port = 8200
    path = "/"
    

  }



}



resource "aws_lb_listener" "vault_lb_listener" {
  load_balancer_arn = aws_lb.vault_lb.arn
  protocol = "HTTPS"
  port = 443
  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.vault_alb_tg.arn
  }
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.vault_acm_certificate.arn
}







resource "aws_alb_target_group_attachment" "vault_alb_tg_attach" {
target_group_arn =  aws_alb_target_group.vault_alb_tg.arn
target_id = aws_instance.vault-app.id
port = 8200
}
