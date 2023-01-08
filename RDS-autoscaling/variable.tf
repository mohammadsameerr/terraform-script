variable "identifier" {
  default = "storage-autoscaling"
}
variable "engine" {
  default = "MySQL"
}
variable "engine_version" {
  default = 5.7
}
variable "instance_class" {
  default = "db.t2.micro"
}
variable "db_name" {
  default = "my-rds"
}
variable "username" {
  default = "mahira"
}
variable "password" {
  default = "admin1234"
}
variable "parameter_group_name" {
  default = "default.mysql5.7"
}
variable "allocated_storage" {
  default = 10
}
variable "max_allocated_storage" {
  default = 100
}
