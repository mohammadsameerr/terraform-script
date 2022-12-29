variable "ami-id" {
  description = "This variable is used to define ami id"
  default     = "ami-074dc0a6f6c764218"
}

variable "aws-region" {
  default = "ap-south-1a"
}

variable "aws_iam_role" {
  default = "iam-role"
}

variable "aws_iam_user" {
  default = "sam1"
}
variable "aws_iam_group" {
  default = "SamG1"
}
variable "aws_iam_policy_attachment" {
  default = "mypolicy"   
}