terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.10.0"
    }
  }
  backend "s3" {
    bucket = "semyon-shvets-tfstate"    // Bucket where to SAVE Terraform State
    key    = "task01/terraform.tfstate" // Object name in the bucket to SAVE Terraform State
    region = "us-east-1"                // Region where bycket created
  }
}

provider "aws" {
  region = "us-east-1"
}

module "task01" {
  source = "./modules/task01_m"
  tags = {
    Name       = "task01_module"
    First_name = "Semen"
    Last_name  = "Shvets"
  }
}
