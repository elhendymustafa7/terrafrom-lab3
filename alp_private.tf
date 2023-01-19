resource "aws_lb" "lp_private" {
  name               = "lpprivate"
  internal           = true
  load_balancer_type = "application"
  subnets            = [module.network.praivate_subnet1_id, module.network.praivate_subnet2_id]
  security_groups    = [aws_security_group.alb_Public.id]
  enable_deletion_protection = false
  tags = {
    Name = "lp_private"
  }
}

resource "aws_lb_listener" "private_listener" {
  load_balancer_arn = aws_lb.lp_private.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.private_target.arn             
  }
}

resource "aws_lb_target_group" "private_target" {
  name     = "privatetarget"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.network.vpc_main_id
}

resource "aws_lb_target_group_attachment" "Private_attachment1" {
  target_group_arn = aws_lb_target_group.private_target.arn
  target_id        = aws_instance.private1.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "Private_attachment2" {
  target_group_arn = aws_lb_target_group.private_target.arn
  target_id        = aws_instance.private2.id 
  port             = 80
}
