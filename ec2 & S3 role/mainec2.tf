
resource "aws_iam_role" "sam_ec2_role" {
  name = "sam_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "sam1"
  }
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "sam-ec2"
  role = aws_iam_role.sam_ec2_role.name
}

resource "aws_instance" "iam_ec2" {
  ami                  = var.ami-id
  instance_type        = var.instance-type
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  key_name             = var.tag-key

  tags = {
    Name = "myec2"
  }
}

