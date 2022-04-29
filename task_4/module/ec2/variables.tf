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

variable "subnet_id" {
  description = "subnet id"
  type        = string
  default     = ""
}

variable "instance_count" {
  description = "instance count"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "instace type"
  type        = string
  default     = "t2.micro"
}

variable "tags" {
  description = "tags"
  type        = map
  default = {
    First_name = "firstName"
    Last_name  = "secondName"
  }
}

variable "name" {
  description = "instance name"
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

variable "sg_id_list" {
  description = "list of security groups to attach"
  type        = list
  default     = []
}

variable "key_pair_name" {
  description = "key_pair name"
  type        = string
  default     = ""
}

variable "private_key_path" {
  description = "id.rsa private part of a key pair for provisioned remote-exec connection"
  type        = string
  default     = "~/.ssh/id_rsa"
}
