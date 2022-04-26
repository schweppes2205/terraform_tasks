variable "instances_param_lst" {
  description = "ec2 instances params"
  type = list(object({
    key               = number
    availability_zone = string
    subnet_name       = string
    name              = string
    ami_param = object({
      most_recent = bool
      name_regex  = string
      owners      = list(string)
      local_user  = string
    })
    root_volume_param = object({
      volume_size = number
      volume_type = string
    })
    instance_type    = string
    ssh_public_key   = map(string)
    private_key_path = string
  }))
}

variable "region" {
  description = "region"
  type        = string
}

variable "vpc_id" {
  description = "vpc to place an EC2 instance"
  type        = string
}

variable "security_group_name" {
  description = "security group name"
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

# variable "availability_zone" {
#   description = "AZ to place an EC2 instance"
#   type        = string
# }

# variable "subnet_name" {
#   description = "subnet name where the EC2 instnace should be attached"
#   type        = string
# }

# variable "ami_param" {
#   description = "ami image parameters"
#   type = object({
#     most_recent = bool
#     name_regex  = string
#     owners      = list(string)
#     local_user  = string
#   })
# }

# variable "root_volume_param" {
#   description = "root volume type and size"
#   type = object({
#     volume_type = string
#     volume_size = number
#   })
# }

# variable "instance_type" {
#   description = "instace type"
#   type        = string
# }

variable "tags" {
  description = "tags"
  type        = map
}

# variable "ssh_public_key" {
#   description = "value"
#   type        = map
# }

# variable "private_key_path" {
#   description = "id.rsa private part of a key pair for provisioned remote-exec connection"
#   type        = string
# }

# variable "instance_count" {
#   description = "instance count"
#   type        = number
# }
