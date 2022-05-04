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

variable "ami_param" {
  description = "ami image parameters"
  type = object({
    most_recent = bool
    name_regex  = string
    owners      = list(string)
  })
}

variable "launch_config_name" {
  description = "launch configuration name"
  type        = string
}

variable "image_id" {
  description = "launch configuration image id"
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

