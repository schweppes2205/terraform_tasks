#############
#DATASOURCES#
#############

data "template_file" "container_definition" {
  template = file("${path.module}/task_definition.json.tpl")
  vars = {
    td_name             = var.td_name,
    td_image            = var.td_image,
    td_cpu              = var.td_cpu,
    td_memory           = var.td_memory,
    td_pm_hostPort      = var.td_pm_hostPort,
    td_pm_containerPort = var.td_pm_containerPort,
    td_pm_protocol      = var.td_pm_protocol
  }
}

###########
#VARIABLES#
###########

###########
#RESOURCES#
###########

resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name
  tags = var.tags
}

resource "aws_ecs_task_definition" "task_definition" {
  family                = var.td_family
  container_definitions = data.template_file.container_definition.rendered
  tags                  = var.tags
}

resource "aws_ecs_service" "ecs_service" {
  name            = var.ecs_svc_name
  cluster         = aws_ecs_cluster.ecs_cluster.id
  launch_type     = var.ecs_svc_launchtype
  desired_count   = var.ecs_svc_count
  task_definition = aws_ecs_task_definition.task_definition.arn

}
