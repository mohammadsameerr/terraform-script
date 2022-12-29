variable "ami-id" {
  description = "This variable is used to define ami id"
  default     = "ami-074dc0a6f6c764218"
}

variable "aws-region" {
  default = "ap-south-1a"
}

variable "tag-key" {
  default = "new-key"

}

variable "vpc_id" {
  default = "vpc-0999904598f6cfda1"

}

variable "subnet" {
 default = "subnet-0c369962602394594"
}