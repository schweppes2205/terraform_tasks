region = "us-east-1"

subnets_name = ["my_subnet-use1-az1"]

ssh_public_key = {
  name  = "my_custom_key_tfvars"
  value = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDKHTblBzJfcdwSNQO9o8FO/YHpfMBDzsjj8q70bEkaBh1+c1sfdun8RXrFZgJQIXAlYAzzWsgNhAEvEDJk8fjVEJyos6XbrGCn14GQRXKplhov9EJNmK1LI6oC3QmHiV2lU5/VwXltWyDg8uvgglIk5lspQa1mdqWFPURZYKXfCQHLW+zSmGT/PMeqVT6LmDnqNSi5RI9ys7l8R6RbMXSaKOHm+5DqVzrMY5NLg27N2RQ6ZJwpc2oyXcJefjozQWxDNtEmRTB4bP+mG/nwfyG19Z0oe7rRxsnTVSl335x6FtQU0hhIfYo+X8wtT6GeayWoy3qE3MhmtDHO08wM9XKwXr/C/EkpH4rgobB9HxrwTelinCObfvW1piZtOEGmAv5t/MUfvl6n7hbk4fYtyBrXYQ6VgeKeNr3AnjiOjWCro19+kzgJ+WkWn8dH9dUel1ypRPWeaiHHD7rWNIqK6GYg15P1YECqw+7a786NcetcmMSsJF4UovjNX4UtpcjjTfs= Semen_Shvets@EPRUMOSW0537"
}

tags = {
  First_name = "Semen"
  Last_name  = "Shvets"
  Tag_Source = "tfvars_file"
}

ami_param = {
  most_recent  = true
  name_regex   = "amzn2-ami-ecs-hvm-2.0.2022"
  owners       = ["amazon"]
  architecture = ["x86_64"]
}

launch_config_name = "my_custom_launch_config"

instance_type = "t2.micro"

root_volume_param = {
  volume_size = 30
  volume_type = "gp3"
}

ecs_cluster_name = "my_ecs_cluster_tfvars"

asg_param = {
  desired_capacity = 2
  max_size         = 4
  min_size         = 2
  name             = "my_custom_asg_tfvars"
}

instace_name = "inst_name_tfvars"

create_sg = true

security_group_name = "my_sg"

vpc_id = "vpc-00dc32518740e437f"

sgr_ingress = [
  {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    description = "SSH"
  },
  {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    description = "HTTPS"
  },
  {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    description = "HTTP80"
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
