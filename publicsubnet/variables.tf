variable "ami-id" {
  description = "This variable is used to define ami id"
  default     = "ami-074dc0a6f6c764218"
}

variable "aws-region" {
  default = "ap-south-1a"
}


variable "tag-key" {
  type    = string
  default = "new-key"
}

variable "instance_type" {
    default = "t2.micro"
}
