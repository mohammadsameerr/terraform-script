resource "aws_ecr_repository" "sam-container" {
  name = "sam-repository"

  image_scanning_configuration {
    scan_on_push = true
  }
  
}
