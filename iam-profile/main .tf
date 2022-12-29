resource "aws_iam_policy" "ec2_policy" {
  name   = "sam_policy"
  policy = var.iam_policy
}

resource "aws_iam_role" "ec2_role" {
  name               = "sam_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ec2_policy_attachment" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_policy.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "sam_profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_instance" "ec2_instance" {
  ami                  = var.ami-id
  instance_type        = var.instance-type
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
}

