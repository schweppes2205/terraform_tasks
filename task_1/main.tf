terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.10.0"
    }
  }
  backend "s3" {
    bucket = "semyon-shvets-tfstate"
    key    = "task01/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "task01" {
  source = "./module"
  tags = {
    First_name    = "Semen"
    Last_name     = "Shvets"
    Date_creation = timestamp()
  }
}
