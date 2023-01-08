variable "identifier" {
  default = "backup"
}
variable "allocated_storage" {
  default = 10
}
variable "engine" {
  default = "postgres"
}
variable "engine_version" {
    type = number
  default = 13.4
}
variable "instance_class" {
  default = "db.t3.micro"
}

variable "name" {
  default = "mydb"
}
variable "username" {
 default =  "mahira"
}
variable "password" {
  default = "admin1234"
}
variable "backup_retention_period" {
  default = 7
}