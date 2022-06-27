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
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))
  default = [{
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "SSH"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP80"
    },
  ]
}

variable "sgr_egress" {
  description = "security group rules - egress"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = string
  }))
  default = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
  }]
}
