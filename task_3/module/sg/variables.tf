variable "create_sg" {
  description = "value to detect if sg should be created"
  type        = bool
  default     = false
}

variable "security_group_name" {
  description = "security group name"
  type        = string
  default     = "my_sg"
}

variable "vpc_id" {
  description = "vpc to place an EC2 instance"
  type        = string
  default     = "vpc-00dc32518740e437f"
}

variable "tags" {
  description = "tags"
  type        = map
  default = {
    First_name = "firstName"
    Last_name  = "secondName"
  }
}

variable "sgr_ingress" {
  description = "security group rules - ingress"
  type        = list(map(string))
  default = [
    {
      from_port   = "22"
      to_port     = "22"
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "SSH"
    },
    {
      from_port   = "80"
      to_port     = "80"
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "HTTP80"
    },

    {
      from_port   = "8080"
      to_port     = "8080"
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "HTTP8080"
    },
    {
      from_port   = "443"
      to_port     = "443"
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "HTTPS"
    },
  ]
}

variable "sgr_egress" {
  description = "security group rules - egress"
  type        = list(map(string))
  default = [
    {
      from_port   = "0"
      to_port     = "0"
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}
