variable "ami-id" {
  description = "This variable is used to define ami id"
  default     = "ami-074dc0a6f6c764218"
}

variable "aws-region" {
  default = "ap-south-1a"
}

variable "instance-type" {
  type    = string
  default = "t2.micro"
}

variable "availability_zone" {
  default = "ap-south-1a"
}

variable "size" {
  type = number
  default = 40
}

variable "security_groups" {
  default = ["sg-09cd454757b289aa4","sg-078ffcb84f0965d2a"]
}
