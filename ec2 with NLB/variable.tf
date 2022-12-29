variable "security_groups" {
    default = ["sg-039bb450c7621c290","sg-03f74afcb38466d78"]
  
}


variable "subnet_id" {
  default = ["subnet-011f698d4be6311ac","subnet-06da87741c7d8db5a"]

}

variable "vpc_id" {
    default = "vpc-0ad685dbcd60f82f9"
  
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "ami_id" {
    type = string
    default = "ami-0b5eea76982371e91"
}
