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

variable "max_size" {
  type = number
  default = "1"
}
variable "min_size" {
  type = number
  default = "1"
}
variable "desired_capacity" {
  type = number
  default = "1"
}
