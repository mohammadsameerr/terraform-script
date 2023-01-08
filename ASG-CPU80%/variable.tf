variable "ami-id" {
  default     = "ami-074dc0a6f6c764218"
}

variable "availability_zones" {
  default = "ap-south-1a"
}

variable "instance-type" {
  type    = string
  default = "t2.micro"
}

variable "asg_min_size" {
  default = 1
}

variable "asg_max_size" {
  default = 3
}

variable "asg_desired_capacity" {
  default = 2
}

variable "health_check_grace_period" {
  default = 300
}

variable "security_groups" {
  type    = string
  default = "sg-09cd454757b289aa4"
}

