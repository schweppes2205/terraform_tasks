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

#############
#DATASOURCES#
#############

data "aws_caller_identity" "current" {}

###########
#RESOURCES#
###########

resource "aws_key_pair" "ssh_key" {
  key_name   = var.ssh_public_key.name
  public_key = var.ssh_public_key.value
  tags = merge(var.tags, {
    AWS_Account_ID = data.aws_caller_identity.current.account_id
  })
}

#########
#MODULES#
#########

module "ec2" {
  source            = "./module/ec2"
  for_each          = { for item in var.instances_param_lst : item.key => item }
  ami_param         = each.value.ami_param
  vpc_id            = var.vpc_id
  availability_zone = each.value.availability_zone
  subnet_name       = each.value.subnet_name
  instance_count    = each.value.instance_count
  instance_type     = each.value.instance_type
  tags              = var.tags
  name              = each.value.name
  root_volume_param = each.value.root_volume_param
  sg_id_list        = [module.sg.sg_id]
  key_pair_name     = aws_key_pair.ssh_key.key_name
  private_key_path  = each.value.private_key_path
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
