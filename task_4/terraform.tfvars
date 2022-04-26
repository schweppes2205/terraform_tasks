region = "us-east-1"

instances_param_lst = [
  {
    key               = 1
    availability_zone = "us-east-1b"
    subnet_name       = "my_subnet-use1-az1"
    name              = "task04_01"
    ami_param = {
      most_recent = true
      name_regex  = "amzn2-ami-kernel"
      owners      = ["amazon"]
      local_user  = "ec2-user"
    }
    root_volume_param = {
      volume_size = 8
      volume_type = "gp3"
    }
    instance_type = "t2.micro"
    ssh_public_key = {
      name  = "my_custom_key_tfvars"
      value = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDKHTblBzJfcdwSNQO9o8FO/YHpfMBDzsjj8q70bEkaBh1+c1sfdun8RXrFZgJQIXAlYAzzWsgNhAEvEDJk8fjVEJyos6XbrGCn14GQRXKplhov9EJNmK1LI6oC3QmHiV2lU5/VwXltWyDg8uvgglIk5lspQa1mdqWFPURZYKXfCQHLW+zSmGT/PMeqVT6LmDnqNSi5RI9ys7l8R6RbMXSaKOHm+5DqVzrMY5NLg27N2RQ6ZJwpc2oyXcJefjozQWxDNtEmRTB4bP+mG/nwfyG19Z0oe7rRxsnTVSl335x6FtQU0hhIfYo+X8wtT6GeayWoy3qE3MhmtDHO08wM9XKwXr/C/EkpH4rgobB9HxrwTelinCObfvW1piZtOEGmAv5t/MUfvl6n7hbk4fYtyBrXYQ6VgeKeNr3AnjiOjWCro19+kzgJ+WkWn8dH9dUel1ypRPWeaiHHD7rWNIqK6GYg15P1YECqw+7a786NcetcmMSsJF4UovjNX4UtpcjjTfs= Semen_Shvets@EPRUMOSW0537"
    }
    private_key_path = "~/.ssh/id_rsa"
  },
  {
    key               = 2
    availability_zone = "us-east-1b"
    subnet_name       = "my_subnet-use1-az1"
    name              = "task04_02"
    ami_param = {
      most_recent = true
      name_regex  = "amzn2-ami-kernel"
      owners      = ["amazon"]
      local_user  = "ec2-user"
    }
    root_volume_param = {
      volume_size = 8
      volume_type = "gp3"
    }
    instance_type = "t2.micro"
    ssh_public_key = {
      name  = "my_custom_key_tfvars"
      value = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDKHTblBzJfcdwSNQO9o8FO/YHpfMBDzsjj8q70bEkaBh1+c1sfdun8RXrFZgJQIXAlYAzzWsgNhAEvEDJk8fjVEJyos6XbrGCn14GQRXKplhov9EJNmK1LI6oC3QmHiV2lU5/VwXltWyDg8uvgglIk5lspQa1mdqWFPURZYKXfCQHLW+zSmGT/PMeqVT6LmDnqNSi5RI9ys7l8R6RbMXSaKOHm+5DqVzrMY5NLg27N2RQ6ZJwpc2oyXcJefjozQWxDNtEmRTB4bP+mG/nwfyG19Z0oe7rRxsnTVSl335x6FtQU0hhIfYo+X8wtT6GeayWoy3qE3MhmtDHO08wM9XKwXr/C/EkpH4rgobB9HxrwTelinCObfvW1piZtOEGmAv5t/MUfvl6n7hbk4fYtyBrXYQ6VgeKeNr3AnjiOjWCro19+kzgJ+WkWn8dH9dUel1ypRPWeaiHHD7rWNIqK6GYg15P1YECqw+7a786NcetcmMSsJF4UovjNX4UtpcjjTfs= Semen_Shvets@EPRUMOSW0537"
    }
    private_key_path = "~/.ssh/id_rsa"
  },

]

vpc_id = "vpc-00dc32518740e437f"

security_group_name = "my_sg"

sgr_ingress = [
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

sgr_egress = [
  {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
  },
]

# availability_zone = "us-east-1b"

# subnet_name = "my_subnet-use1-az1"

# ami_param = {
#   most_recent = true
#   name_regex  = "amzn2-ami-kernel"
#   owners      = ["amazon"]
#   local_user  = "ec2-user"
# }

# root_volume_param = {
#   volume_size = 8
#   volume_type = "gp3"
# }

# instance_type = "t2.micro"

tags = {
  First_name = "Semen"
  Last_name  = "Shvets"
  Tag_Source = "tfvars_file"
}

# ssh_public_key = {
#   name  = "my_custom_key_tfvars"
#   value = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDKHTblBzJfcdwSNQO9o8FO/YHpfMBDzsjj8q70bEkaBh1+c1sfdun8RXrFZgJQIXAlYAzzWsgNhAEvEDJk8fjVEJyos6XbrGCn14GQRXKplhov9EJNmK1LI6oC3QmHiV2lU5/VwXltWyDg8uvgglIk5lspQa1mdqWFPURZYKXfCQHLW+zSmGT/PMeqVT6LmDnqNSi5RI9ys7l8R6RbMXSaKOHm+5DqVzrMY5NLg27N2RQ6ZJwpc2oyXcJefjozQWxDNtEmRTB4bP+mG/nwfyG19Z0oe7rRxsnTVSl335x6FtQU0hhIfYo+X8wtT6GeayWoy3qE3MhmtDHO08wM9XKwXr/C/EkpH4rgobB9HxrwTelinCObfvW1piZtOEGmAv5t/MUfvl6n7hbk4fYtyBrXYQ6VgeKeNr3AnjiOjWCro19+kzgJ+WkWn8dH9dUel1ypRPWeaiHHD7rWNIqK6GYg15P1YECqw+7a786NcetcmMSsJF4UovjNX4UtpcjjTfs= Semen_Shvets@EPRUMOSW0537"
# }

# private_key_path = "~/.ssh/id_rsa"

# instance_count = 0
