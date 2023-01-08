resource "aws_db_instance" "Rest-encrypt" {
 identifier = "encryption-rest"
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = true

  multi_az = false 
  backup_retention_period = var.backup_retention_period
  auto_minor_version_upgrade = true

  storage_encrypted = true
}
