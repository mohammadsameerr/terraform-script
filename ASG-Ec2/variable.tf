variable "ami-id" {
  description = "This variable is used to define ami id"
  default     = "ami-074dc0a6f6c764218"
}

variable "instance-type" {
  type    = string
  default = "t2.micro"
}

variable "availability_zones" {
  default = "ap-south-1a"
}

variable "security_groups" {
  type    = string
  default = "sg-09cd454757b289aa4"
}

variable "asg_vpc_zone_identifier" {
  default = ["subnet-05c096a071af40d1b", "subnet-0473369452e57fc1b"]
}

variable "max_size" {
  default = 5
}

variable "min_size" {
  default = 1
}

variable "desired_capacity" {
  default = 2
}

variable "health_check_grace_period" {
  default = 300
}
 
