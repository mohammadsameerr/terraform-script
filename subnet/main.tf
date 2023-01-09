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