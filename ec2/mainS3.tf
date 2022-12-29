
resource "aws_iam_role" "s3_role" {
  name = "s3_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "s3.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "mys3-role"
  }
}


resource "aws_iam_instance_profile" "ec2_profile" {
  name = "sam-ec2"
  role = aws_iam_role.s3_role.name
}

resource "aws_instance" "ec2_s3" {
  ami                  = var.ami-id
  instance_type        = var.instance-type
  key_name             = var.tag-key
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "s3-instance"
  }
}


