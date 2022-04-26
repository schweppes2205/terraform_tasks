#################
#for datasources#
#################

variable "ami_param" {
  description = "ami image parameters"
  type = object({
    most_recent = bool
    name_regex  = string
    owners      = list(string)
    local_user  = string
  })
  default = {
    most_recent = true
    name_regex  = "amzn2-ami-kernel"
    owners      = ["amazon"]
    local_user  = "ec2-user"
  }
}

variable "vpc_id" {
  description = "vpc to place an EC2 instance"
  type        = string
  default     = "vpc-00dc32518740e437f"
}

variable "availability_zone" {
  description = "AZ to place an EC2 instance"
  type        = string
  default     = "us-east-1b"
}

variable "subnet_name" {
  description = "subnet name where the EC2 instnace should be attached"
  type        = string
  default     = "my_subnet-use1-az1"
}

###############
#for resources#
###############

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
