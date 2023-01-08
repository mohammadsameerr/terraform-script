variable "identifier" {
  default = "snap-shot"
}
variable "allocated_storage" {
  default = 10
}
variable "engine" {
  default = "mysql"
}
variable "engine_version" {
  default = "8.0.30"
}
variable "instance_class" {
  default = "db.t3.micro"
}
variable "name" {
  default = "db_name"
}
variable "username" {
 default =  "mahira"
}
variable "password" {
  default = "admin1234"
}
variable "parameter_group_name" {
  default = "default.mysql8.0"
}
variable "backup_retention_period" {
  default  = 0
}
variable "maintenance_window" {
  default = "Fri:09:00-Fri:09:30"
}