terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
  alias  = "replica"
}


provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}
