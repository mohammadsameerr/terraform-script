resource "aws_lb" "sam-alb" {
  name               = "sam-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${var.security_groups}"]
  subnets = [
    "${var.subnet1}",
    "${var.subnet2}",
  ]


  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}
