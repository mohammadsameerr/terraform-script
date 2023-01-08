resource "aws_efs_file_system" "sam_EFS1" {
  creation_token = "EFS1"

  tags = {
    Name = "Sam-EFS"
  }
}
