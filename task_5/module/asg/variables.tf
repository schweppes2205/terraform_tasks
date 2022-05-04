#################
#for datasources#
#################

variable "ami_param" {
  description = "ami image parameters"
  type = object({
    most_recent = bool
    name_regex  = string
    owners      = list(string)
  })
  default = {
    most_recent = true
    name_regex  = "amzn2-ami-kernel"
    owners      = ["amazon"]
  }
}

###############
#for resources#
###############

variable "launch_config_name" {
  description = "launch configuration name"
  type        = string
  default     = "launch_config"
}

variable "image_id" {
  description = "launch configuration image id"
  type        = string
  default     = "ami-0022f774911c1d690"
}

variable "instance_type" {
  description = "instace type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "key_pair name"
  type        = string
  default     = ""
}

variable "root_volume_param" {
  description = "root volume type and size"
  type = object({
    volume_type = string
    volume_size = number
  })
  default = {
    volume_size = 8
    volume_type = "gp3"
  }
}

variable "asg_param" {
  description = "autoscaling group params"
  type = object({
    name             = string
    min_size         = number
    max_size         = number
    desired_capacity = number
  })
  default = {
    name             = "my_asg"
    min_size         = 1
    max_size         = 1
    desired_capacity = 1
  }
}

variable "instace_name" {
  description = "instance name"
  type        = string
  default     = "inst_name"
}

variable "vpc_zone_identifier" {
  description = "subnets where EC2 instances launched by ASG should be placed"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "tags"
  type        = map
  default = {
    First_name = "firstName"
    Last_name  = "secondName"
  }
}

