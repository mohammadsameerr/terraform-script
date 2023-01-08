resource "aws_launch_configuration" "ec2-launch" {
  name_prefix     = "ec2-launch"
  image_id        = var.ami-id
  instance_type   = var.instance-type
  security_groups = [var.security_groups]
}

resource "aws_autoscaling_group" "sam-asg" {
  name                      = "sam-asg"
  vpc_zone_identifier       = var.asg_vpc_zone_identifier
  launch_configuration      = aws_launch_configuration.ec2-launch.name
  max_size                  = var.max_size
  min_size                  = var.min_size
  desired_capacity          = var.desired_capacity
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = "EC2"
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "ec2 instance"
    propagate_at_launch = true
  }
}

resource "aws_elb" "sam-elb" {
  name               = "sameer-elb"
  availability_zones = [var.availability_zones]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_my-elb" {
  autoscaling_group_name = aws_autoscaling_group.sam-asg.id
  elb                    = aws_elb.sam-elb.id
}
resource "aws_instance" "sam-ec2" {
  ami           = var.ami-id
  instance_type = var.instance-type
}
# Create a new load balancer attachment
resource "aws_elb_attachment" "sam-ec2" {
  elb      = aws_elb.sam-elb.id
  instance = aws_instance.sam-ec2.id
}
