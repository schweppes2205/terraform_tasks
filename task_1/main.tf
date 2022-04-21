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
# data "aws_caller_identity" "current" {}

locals {
  Date_time = timestamp()
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      First_name    = "Semen"
      Last_name     = "Shvets"
      Date_creation = locals.Date_creation
      # Account_id    = data.aws_caller_identity.current.account_id
    }
  }
}

module "task01" {
  source = "./module"
  tags = {
    Name = "task01_module"
  }
}
