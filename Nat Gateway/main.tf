resource "aws_vpc" "sameer100" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "sameer100"
  }
}

resource "aws_subnet" "Subnet100" {
  vpc_id     = aws_vpc.sameer100.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Subnet100"
  }
}

resource "aws_instance" "sam-ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  
  
  tags = {
    Name = "ec2-1"
  }
}

resource "aws_eip" "sam_lb" {
  instance = aws_instance.sam-ec2.id
  vpc      = true
}

resource "aws_nat_gateway" "Sam_nat" {
  allocation_id = aws_eip.sam_lb.id
  subnet_id     = aws_subnet.Subnet100.id

  tags = {
    Name = "Sam-NAT"
  }