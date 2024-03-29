variable "region" {
  description = "region"
  type        = string
}

variable "vpc_id" {
  description = "vpc to place an EC2 instance"
  type        = string
}

variable "availability_zone" {
  description = "AZ to place an EC2 instance"
  type        = string
}

variable "subnet_name" {
  description = "subnet name where the EC2 instnace should be attached"
  type        = string
}

variable "ami_search_param" {
  description = "ami image search params"
  type = object({
    most_recent = bool
    name_regex  = string
    owners      = list(string)
    local_user  = string
  })
}

variable "root_volume_param" {
  description = "root volume type and size"
  type = object({
    volume_type = string
    volume_size = number
  })
}

variable "ssh_public_key" {
  description = "value"
  type        = map
}

variable "instance_type" {
  description = "instace type"
  type        = string
}

variable "tags" {
  description = "tags"
  type        = map
}

variable "private_key_path" {
  description = "id.rsa private part of a key pair for provisioned remote-exec connection"
  type        = string
}

variable "instance_count" {
  description = "instance count"
  type        = number
}
