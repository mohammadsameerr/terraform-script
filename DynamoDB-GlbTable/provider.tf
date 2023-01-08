
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
  }
}
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}
provider "aws" {
  alias = "us-west-2"
  region = "us-west--2"
}

provider "aws" {
  access_key = ""
  secret_key = ""
}
