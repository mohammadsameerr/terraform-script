resource "aws_vpc" "sameer100" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "sameer100"
  }
}

#VPC Endpoint With S3
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.sameer100.id
  service_name = "com.amazonaws.ap-south-1a.s3"

  tags = {
    Environment = "dev"
  }
}

# VPC endpoint with DynamoDB
resource "aws_vpc_endpoint" "dynamodb" {
  vpc_id       = aws_vpc.sameer100.id
  service_name = "com.amazonaws.ap-south-1a.dynamodb"

  tags = {
    Environment = "dev"
  }
}