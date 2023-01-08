
resource "aws_dynamodb_table" "us-east-1" {
  provider = aws.us-east-1
  hash_key         = "Attribute"
  name             = "Table10"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
  read_capacity    = 1
  write_capacity   = 1

  attribute {
    name = "Attribute10"
    type = "S"
  }
}

resource "aws_dynamodb_table" "us-west-2" {
  provider = aws.us-west-2
  hash_key         = "Attribute"
  name             = "Table20"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
  read_capacity    = 1
  write_capacity   = 1

  attribute {
    name = "Attribute20"
    type = "S"
  }
}

resource "aws_dynamodb_global_table" "Sam-Table" {
  depends_on = [
    aws_dynamodb_table.us-east-1,
    aws_dynamodb_table.us-west-2,
  ]
  provider = aws.us-east-1

  name = "sam-Table3"

  replica {
    region_name = "us-east-1"
  }

  replica {
    region_name = "us-west-2"
  }
}
