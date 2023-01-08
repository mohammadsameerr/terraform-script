
resource "aws_instance" "Sam_ec2" {
  ami             = var.ami-id
  instance_type   = var.instance-type
  security_groups = [var.security_groups]
  subnet_id = var.subnet_id
  availability_zone = var.availability_zones
  
  tags = {
    Name = "Ec2-Efs"
  }
}
resource "aws_efs_file_system" "Sam_EFS" {
  creation_token = "Sam_efs1"
  tags = {
    Name = "sam-efs"
  }
}
resource "aws_efs_mount_target" "mount" {
  file_system_id  = aws_efs_file_system.Sam_EFS.id
  subnet_id       = var.subnet_id
  security_groups = [var.security_groups]
}  
