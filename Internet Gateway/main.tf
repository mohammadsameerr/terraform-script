resource "aws_vpc" "sameer100" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "sameer100"
  }
}

resource "aws_internet_gateway" "sam_internet" {
  vpc_id = aws_vpc.sameer100.id

  tags = {
    Name = "sam-internet"
  }
}