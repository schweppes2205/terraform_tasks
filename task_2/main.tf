terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.10.0"
    }
  }
  backend "s3" {
    bucket = "semyon-shvets-tfstate"
    key    = "task02/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

module "task02" {
  source           = "./module"
  region           = var.region
  tags             = var.tags
  instance_type    = var.instance_type
  ssh_public_key   = var.ssh_public_key
  private_key_path = var.private_key_path
  instance_count   = var.instance_count
}
