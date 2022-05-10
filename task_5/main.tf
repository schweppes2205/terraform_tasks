terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.10.0"
    }
  }
  backend "s3" {
    bucket = "semyon-shvets-tfstate"
    key    = "task05/terraform.tfstate"
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

data "aws_subnets" "subnets" {
  filter {
    name   = "tag:Name"
    values = var.subnets_name
  }
}

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

module "securityGroup" {
  source              = "./module/sg"
  create_sg           = var.create_sg
  security_group_name = var.security_group_name
  vpc_id              = var.vpc_id
  tags                = var.tags
  sgr_ingress         = var.sgr_ingress
  sgr_egress          = var.sgr_egress
}

module "elasticContainerSerice" {
  source           = "./module/ecs"
  ecs_cluster_name = var.ecs_cluster_name
  tags             = var.tags
}

module "autoScalingGroup" {
  source             = "./module/asg"
  ami_param          = var.ami_param
  launch_config_name = var.launch_config_name
  # image_id            = var.image_id
  instance_type       = var.instance_type
  key_name            = aws_key_pair.ssh_key.key_name
  asg_param           = var.asg_param
  root_volume_param   = var.root_volume_param
  ecs_cluster_name    = var.ecs_cluster_name
  sg_id               = module.securityGroup.sg_id
  instace_name        = var.instace_name
  vpc_zone_identifier = data.aws_subnets.subnets.ids
  tags = merge(var.tags, {
    AWS_Account_ID = data.aws_caller_identity.current.account_id
  })
  depends_on = [
    module.securityGroup,
    module.elasticContainerSerice,
  ]
}
