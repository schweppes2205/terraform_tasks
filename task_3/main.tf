terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.10.0"
    }
  }
  backend "s3" {
    bucket = "semyon-shvets-tfstate"
    key    = "task03/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

##############
#DATA SOURCES#
##############

data "aws_subnet" "subnet" {
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
  filter {
    name   = "tag:Name"
    values = [var.subnet_name]
  }
}

#########
#MODULES#
#########

module "sg" {
  source              = "./module/sg"
  create_sg           = var.instance_count > 0 ? true : false
  security_group_name = var.security_group_name
  vpc_id              = var.vpc_id
  tags                = var.tags
  sgr_ingress         = var.sgr_ingress
  sgr_egress          = var.sgr_egress
}

module "ec2" {
  source            = "./module/ec2"
  region            = var.region
  subnet_id         = data.aws_subnet.subnet.id
  ami_param         = var.ami_param
  root_volume_param = var.root_volume_param
  sg_id_list        = [module.sg.sg_id]
  tags              = var.tags
  instance_type     = var.instance_type
  ssh_public_key    = var.ssh_public_key
  private_key_path  = var.private_key_path
  instance_count    = var.instance_count
}
