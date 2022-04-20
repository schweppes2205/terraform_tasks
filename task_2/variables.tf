variable "region" {
  description = "region"
  type        = string
}

variable "tags" {
  description = "tags"
  type        = map
}

variable "instance_type" {
  description = "instace type"
  type        = string
}

variable "ssh_public_key" {
  description = "value"
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
