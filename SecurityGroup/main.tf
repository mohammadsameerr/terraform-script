
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "sam_vpc"
  }
}
resource "aws_security_group" "allow_sg" {
  name        = "HTTP and SSH"
  description = "Allow HTTP and SSH access"
  vpc_id = aws_vpc.main.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_web"
  }
}

resource "aws_instance" "sg_instance" {
  ami               = var.ami-id
  instance_type     = var.instance-type
  availability_zone = "ap-south-1a"
  security_groups   = aws_security_group.allow_sg.id

  tags = {
    name = "sameer1"
  }
}
