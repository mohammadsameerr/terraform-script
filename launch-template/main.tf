resource "aws_launch_template" "sam_lt" {
  name_prefix   = "sam-lt"
  image_id      = var.ami-id
  instance_type = var.instance-type
}

resource "aws_autoscaling_group" "asg" {
  name = "asg"
  availability_zones = ["${var.aws-region}"]
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size

  launch_template {
    id      = aws_launch_template.sam_lt.id
    version = "$Latest"
  }
}
