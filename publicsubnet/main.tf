
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "sameer_vpc"
  }
}

# public subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "public_subnet"
  }
}

# security group
resource "aws_security_group" "web_sg" {
  name        = "HTTP and SSH"
  description = "Allow  HTTP and SSH access"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = " HTTP access from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http"
  }
}

resource "aws_instance" "public" {
  ami           = var.ami-id
  instance_type = var.instance-type
  subnet_id = aws_subnet.public.id

  tags = {
    Name = "sam-ec2"
  }
}