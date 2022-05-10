variable "ecs_cluster_name" {
  description = "ecs cluster name"
  type        = string
  default     = "my_ecs_cluster"
}

variable "tags" {
  description = "tags"
  type        = map
  default = {
    First_name = "firstName"
    Last_name  = "secondName"
  }
}

variable "td_family" {
  description = "ecs task definition family"
  type        = string
  default     = "my_task"
}

variable "td_name" {
  description = "task definition name"
  type        = string
  default     = "nginxHello"
}

variable "td_image" {
  description = "task definition image"
  type        = string
  default     = "nginxdemos/hello"
}

variable "td_cpu" {
  description = "task definition cpu"
  type        = number
  default     = 0
}

variable "td_memory" {
  description = "task definition memory"
  type        = number
  default     = 300
}

variable "td_pm_hostPort" {
  description = "host port"
  type        = number
  default     = 80
}

variable "td_pm_containerPort" {
  description = "container port"
  type        = number
  default     = 80
}

variable "td_pm_protocol" {
  description = "protocol"
  type        = string
  default     = "tcp"
}

variable "ecs_svc_name" {
  description = "ecs serivce name"
  type        = string
  default     = "my_svc"
}

variable "ecs_svc_launchtype" {
  description = "ecs cluster service launch type"
  type        = string
  default     = "EC2"
}

variable "ecs_svc_count" {
  description = "ecs cluster service instances desired count"
  type        = number
  default     = 1
}
