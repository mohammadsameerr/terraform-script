resource "aws_dynamodb_table" "sam-dynamodb" {
  provider = aws.us-east-1
  hash_key         = "Attribute"
  name             = "Table1"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
  read_capacity    = 1
  write_capacity   = 1

  attribute {
    name = "Attribute"
    type = "S"
  }
}

resource "aws_elasticache_cluster" "sam-elastic-cache" {
  cluster_id           = "elastic-cachecluster"
  engine               = "memcached"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 2
  parameter_group_name = "default.memcached1.6"
  port                 = 11211
}
