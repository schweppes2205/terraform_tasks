variable "region" {
  description = "region"
  type        = string
  default     = "us-east-1"
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

variable "ami_search_param" {
  description = "ami image search params"
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
    local_user  = "ec2_user"
  }
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

variable "ssh_public_key" {
  description = "value"
  type        = map
  default = {
    name  = "my_custom_key"
    value = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDKHTblBzJfcdwSNQO9o8FO/YHpfMBDzsjj8q70bEkaBh1+c1sfdun8RXrFZgJQIXAlYAzzWsgNhAEvEDJk8fjVEJyos6XbrGCn14GQRXKplhov9EJNmK1LI6oC3QmHiV2lU5/VwXltWyDg8uvgglIk5lspQa1mdqWFPURZYKXfCQHLW+zSmGT/PMeqVT6LmDnqNSi5RI9ys7l8R6RbMXSaKOHm+5DqVzrMY5NLg27N2RQ6ZJwpc2oyXcJefjozQWxDNtEmRTB4bP+mG/nwfyG19Z0oe7rRxsnTVSl335x6FtQU0hhIfYo+X8wtT6GeayWoy3qE3MhmtDHO08wM9XKwXr/C/EkpH4rgobB9HxrwTelinCObfvW1piZtOEGmAv5t/MUfvl6n7hbk4fYtyBrXYQ6VgeKeNr3AnjiOjWCro19+kzgJ+WkWn8dH9dUel1ypRPWeaiHHD7rWNIqK6GYg15P1YECqw+7a786NcetcmMSsJF4UovjNX4UtpcjjTfs= Semen_Shvets@EPRUMOSW0537"
  }
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
    First_name = "Semen"
    Last_name  = "Shvets"
  }
}

variable "private_key_path" {
  description = "id.rsa private part of a key pair for provisioned remote-exec connection"
  type        = string
  default     = "~/.ssh/id_rsa"
}

variable "instance_count" {
  description = "instance count"
  type        = number
  default     = 1
}
