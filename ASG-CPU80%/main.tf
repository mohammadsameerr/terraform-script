resource "aws_launch_configuration" "ec2-launch" {
  name_prefix     = "ec2-launch"
  image_id        = var.ami-id
  instance_type   = var.instance-type
  security_groups = [var.security_groups]
}

# Create Auto Scaling group
resource "aws_autoscaling_group" "sam-asg" {
  name                      = "sam-asg"
  availability_zones = [var.availability_zones]
  max_size                  = var.asg_max_size
  min_size                  = var.asg_min_size
  health_check_grace_period = var.health_check_grace_period
  desired_capacity          = var.asg_desired_capacity
  launch_configuration      = aws_launch_configuration.ec2-launch.id

  tag {
    key                 = "Name"
    value               = "asg"
    propagate_at_launch = true
  }
}
resource "aws_autoscaling_policy" "sam_policy" {
  name                   = "sam_policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.sam-asg.name
}

resource "aws_cloudwatch_metric_alarm" "sam_alarm" {
  alarm_name          = "sam_alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.sam-asg.name
  }

  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions     = [aws_autoscaling_policy.sam_policy.arn]
}
