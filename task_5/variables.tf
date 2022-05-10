variable "region" {
  description = "region"
  type        = string
}

variable "subnets_name" {
  description = "subnets name where the EC2 instnace created by ASG should be attached."
  type        = list(string)
}

variable "ssh_public_key" {
  description = "value"
  type        = map
}

variable "tags" {
  description = "tags"
  type        = map
}

variable "td_family" {
  description = "ecs task definition family"
  type        = string
}

variable "td_name" {
  description = "task definition name"
  type        = string
}

variable "td_image" {
  description = "task definition image"
  type        = string
}

variable "td_cpu" {
  description = "task definition cpu"
  type        = number
}

variable "td_memory" {
  description = "task definition memory"
  type        = number
}

variable "td_entp" {
  description = "task definition container entry point"
  type        = list(string)
}

variable "td_cmd" {
  description = "task definition container command"
  type        = list(string)
}

# variable "td_pm_hostPort" {
#   description = "host port"
#   type        = number
# }

# variable "td_pm_containerPort" {
#   description = "container port"
#   type        = number
# }

# variable "td_pm_protocol" {
#   description = "protocol"
#   type        = string
# }

variable "td_pm" {
  description = "task description port mapping"
  type = list(object({
    containerPort = number,
    hostPort      = number,
    protocol      = string
  }))
}

variable "ecs_svc_name" {
  description = "ecs serivce name"
  type        = string
}

variable "ecs_svc_launchtype" {
  description = "ecs cluster service launch type"
  type        = string
}

variable "ecs_svc_count" {
  description = "ecs cluster service instances desired count"
  type        = number
}

variable "ami_param" {
  description = "ami image parameters"
  type = object({
    most_recent  = bool
    name_regex   = string
    owners       = list(string)
    architecture = list(string)
  })
}

variable "launch_config_name" {
  description = "launch configuration name"
  type        = string
}

variable "instance_type" {
  description = "instace type"
  type        = string
}

variable "root_volume_param" {
  description = "root volume type and size"
  type = object({
    volume_type = string
    volume_size = number
  })
}

variable "ecs_cluster_name" {
  description = "ecs cluster name"
  type        = string
}

variable "asg_param" {
  description = "autoscaling group params"
  type = object({
    name             = string
    min_size         = number
    max_size         = number
    desired_capacity = number
  })
}

variable "instace_name" {
  description = "instance name"
  type        = string
}

variable "create_sg" {
  description = "value to detect if sg should be created"
  type        = bool
}

variable "security_group_name" {
  description = "security group name"
  type        = string
}

variable "vpc_id" {
  description = "vpc to place an EC2 instance"
  type        = string
}

variable "sgr_ingress" {
  description = "security group rules - ingress"
  type        = list(map(string))
}

variable "sgr_egress" {
  description = "security group rules - egress"
  type        = list(map(string))
}
