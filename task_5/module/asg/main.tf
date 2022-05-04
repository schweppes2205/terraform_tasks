#############
#DATASOURCES#
#############

data "aws_ami" "ami" {
  most_recent = var.ami_param.most_recent
  name_regex  = var.ami_param.name_regex
  owners      = var.ami_param.owners
}

# data "aws_caller_identity" "current" {}

###########
#VARIABLES#
###########

locals {
  tags_asg = merge(var.tags, {
    Date_creation = timestamp(),
    OS_type       = data.aws_ami.ami.platform_details
  })
}

###########
#RESOURCES#
###########

resource "aws_launch_configuration" "launch_config" {
  name          = var.launch_config_name
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
  # user_data = 
  root_block_device {
    volume_type = var.root_volume_param.volume_type
    volume_size = var.root_volume_param.volume_size
  }
}

resource "aws_autoscaling_group" "asg" {
  name                 = var.asg_param.name
  min_size             = var.asg_param.min_size
  max_size             = var.asg_param.max_size
  desired_capacity     = var.asg_param.desired_capacity
  launch_configuration = aws_launch_configuration.launch_config.name
  vpc_zone_identifier  = var.vpc_zone_identifier
  dynamic "tag" {
    for_each = { for k, v in local.tags_asg : k => v }
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}
