resource "aws_iam_role" "sam-ssm-role" {
  name = "sam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ssm.amazonaws.com"
        }
      },
    ]
  })

}

resource "aws_iam_policy" "ssm_policy" {
  name               = "ssm_policy"



 policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ssm:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_policy_role" {
  role       = aws_iam_role.sam-ssm-role.name
  policy_arn = aws_iam_policy.ssm_policy.arn
}

resource "aws_iam_instance_profile" "ec2-ssm" {
  name = "ec2-ssm"
  role = aws_iam_role.sam-ssm-role.name
}


resource "aws_instance" "ec2-ssm" {
  ami           = var.ami_id
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2-ssm.name
  tags = {
    Name = "ec2-ssm"
  }
}
