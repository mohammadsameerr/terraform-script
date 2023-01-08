resource "aws_db_instance" "sam-snapshot" {
  allocated_storage = var.allocated_storage
  identifier        = var.identifier
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  name              = var.name
  password          = var.password
  username          = var.username

  maintenance_window      = var.maintenance_window
  backup_retention_period = var.backup_retention_period
  parameter_group_name    = var.parameter_group_name
  skip_final_snapshot     = true
}

resource "aws_db_snapshot" "samshot" {
  db_instance_identifier = aws_db_instance.sam-snapshot.id
  db_snapshot_identifier = "samshot"
}
