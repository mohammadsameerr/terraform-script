variable "ami-id" {
  description = "This variable is used to define ami id"
  default     = "ami-074dc0a6f6c764218"
}

variable "availability_zones" {
  default = "ap-south-1a"
}

variable "instance-type" {
  type    = string
  default = "t2.micro"
}

variable "security_groups" {
  type    = string
  default = "sg-09cd454757b289aa4"
}

variable "subnet_id" {
  type    = string
  default = "subnet-05c096a071af40d1b"
}
