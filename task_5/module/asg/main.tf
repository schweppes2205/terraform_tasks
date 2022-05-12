#############
#DATASOURCES#
#############

data "aws_iam_policy_document" "ecs_agent" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}


###########
#VARIABLES#
###########

locals {
  tags_asg = merge(var.tags, {
    OS_type = var.ami_platform_details
  })
}

###########
#RESOURCES#
###########

resource "aws_iam_role" "ecs_agent" {
  name               = "ecs-agent"
  assume_role_policy = data.aws_iam_policy_document.ecs_agent.json
}

resource "aws_iam_role_policy_attachment" "ecs_agent" {
  role       = aws_iam_role.ecs_agent.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "ecs_agent" {
  name = "ecs-agent"
  role = aws_iam_role.ecs_agent.name
}

resource "aws_launch_configuration" "launch_config" {
  name                 = var.launch_config_name
  image_id             = var.image_id
  iam_instance_profile = aws_iam_instance_profile.ecs_agent.name
  instance_type        = var.instance_type
  key_name             = var.key_name
  root_block_device {
    volume_type = var.root_volume_param.volume_type
    volume_size = var.root_volume_param.volume_size
  }
  user_data = templatefile("${path.module}/userdata.sh.tpl", {
    ecs_cluster_name = var.ecs_cluster_name
  })
  security_groups = [var.sg_id]
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
