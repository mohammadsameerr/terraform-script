variable "ami-id" {
  description = "This variable is used to define ami id"
  default     = "ami-074dc0a6f6c764218"
}

variable "aws-region" {
  default = "ap-south-1a"
}

variable "instance-type" {
  type    = string
  default = "t2.micro"
}

variable "iam_policy" {
  type    = string
  default = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "ec2:*",
      "Resource": "*"
    }
  ]
}
EOF
}
