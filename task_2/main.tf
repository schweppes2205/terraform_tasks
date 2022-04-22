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
  source            = "./module"
  region            = var.region
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
  ami_search_param  = var.ami_search_param
  ssh_public_key    = var.ssh_public_key
  instance_type     = var.instance_type
  tags              = var.tags
  private_key_path  = var.private_key_path
  instance_count    = var.instance_count
}
