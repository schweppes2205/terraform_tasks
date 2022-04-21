variable "region" {
  description = "region"
  type        = string
}

variable "ami_param" {
  description = "ami image parameters"
  type = object({
    most_recent = bool
    name_regex  = string
    owners      = list(string)
  })
}

variable "instance_type" {
  description = "instace type"
  type        = string
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

variable "instance_count" {
  description = "instance count"
  type        = number
}
