resource "aws_ecs_cluster" "sam-cluster" {
  name = "sam-cluster"
    
  setting {
    name  = "samcontainer"
    value = "enabled"
  }
}

