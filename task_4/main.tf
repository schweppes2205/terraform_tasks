terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.10.0"
    }
  }
  backend "s3" {
    bucket = "semyon-shvets-tfstate"
    key    = "task04/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

module "ec2" {
  source            = "./module/ec2"
  for_each          = { for item in var.instances_param_lst : item.key => item }
  vpc_id            = var.vpc_id
  sg_id_list        = [module.sg.sg_id]
  tags              = var.tags
  availability_zone = each.value.availability_zone
  subnet_name       = each.value.subnet_name
  ami_param         = each.value.ami_param
  root_volume_param = each.value.root_volume_param
  instance_type     = each.value.instance_type
  ssh_public_key    = each.value.ssh_public_key
  private_key_path  = each.value.private_key_path
  # instance_count    = each.value.instance_count
}

module "sg" {
  source              = "./module/sg"
  create_sg           = length(var.instances_param_lst) > 0 ? true : false
  security_group_name = var.security_group_name
  vpc_id              = var.vpc_id
  tags                = var.tags
  sgr_ingress         = var.sgr_ingress
  sgr_egress          = var.sgr_egress
}
