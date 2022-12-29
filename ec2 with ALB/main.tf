resource "aws_lb" "ALB-1" {
  name               = "SAM-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnet_id

  enable_deletion_protection = false

  tags = {
    Environment = "Alb"
  }
}

resource "aws_lb_target_group" "ALB-tg" {
  name     = "sam-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_instance" "sam-ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  
  
  tags = {
    Name = "ec2-1"
  }
}


resource "aws_lb_listener" "alb-ls" {
  load_balancer_arn = aws_lb.ALB-1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ALB-tg.arn
  }
}


resource "aws_lb_target_group_attachment" "tg-attach" {
  target_group_arn = aws_lb_target_group.ALB-tg.arn
  target_id        = aws_instance.sam-ec2.id
  port             = 80
  
}
