variable "ami_local_user" {
  description = "ami local user"
  type        = string
  default     = "ec2-user"
}

variable "instances_param_lst" {
  description = "ec2 instances params"
  type = list(object({
    ami_param = object({
      most_recent = bool
      name_regex  = string
      owners      = list(string)
    })
    instance_count = number
    instance_type  = string
    name           = string
    root_volume_param = object({
      volume_size = number
      volume_type = string
    })
    private_key_path = string
  }))
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

variable "tags" {
  description = "tags"
  type        = map
}

variable "ssh_public_key" {
  description = "value"
  type        = map
}

variable "private_key_path" {
  description = "id.rsa private part of a key pair for provisioned remote-exec connection"
  type        = string
}
