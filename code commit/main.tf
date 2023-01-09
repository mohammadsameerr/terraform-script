resource "aws_codecommit_repository" "sam-1" {
  repository_name = "terraform-script"
  description     = "This is the Sample App Repository"
}