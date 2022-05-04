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
  most_recent = true
  name_regex  = "amzn2-ami-kernel"
  owners      = ["amazon"]
}

launch_config_name = "my_custom_launch_config"

image_id = "ami-0022f774911c1d690"

instance_type = "t2.micro"

root_volume_param = {
  volume_size = 8
  volume_type = "gp3"
}

asg_param = {
  desired_capacity = 2
  max_size         = 4
  min_size         = 2
  name             = "my_custom_asg_"
}

instace_name = "inst_name_tfvars"
