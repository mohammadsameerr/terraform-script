terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1a"
  access_key = ""
  secret_key = ""
}
