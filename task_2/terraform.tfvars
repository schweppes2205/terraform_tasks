region = "us-east-1"

vpc_id = "vpc-00dc32518740e437f"

availability_zone = "us-east-1b"

subnet_name = "my_subnet-use1-az1"

ami_search_param = {
  most_recent = true
  name_regex  = "amzn2-ami-kernel"
  owners      = ["amazon"]
  local_user  = "ec2-user"
}

root_volume_param = {
  volume_size = 8
  volume_type = "gp3"
}

ssh_public_key = {
  name  = "my_custom_key_tfvars"
  value = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDKHTblBzJfcdwSNQO9o8FO/YHpfMBDzsjj8q70bEkaBh1+c1sfdun8RXrFZgJQIXAlYAzzWsgNhAEvEDJk8fjVEJyos6XbrGCn14GQRXKplhov9EJNmK1LI6oC3QmHiV2lU5/VwXltWyDg8uvgglIk5lspQa1mdqWFPURZYKXfCQHLW+zSmGT/PMeqVT6LmDnqNSi5RI9ys7l8R6RbMXSaKOHm+5DqVzrMY5NLg27N2RQ6ZJwpc2oyXcJefjozQWxDNtEmRTB4bP+mG/nwfyG19Z0oe7rRxsnTVSl335x6FtQU0hhIfYo+X8wtT6GeayWoy3qE3MhmtDHO08wM9XKwXr/C/EkpH4rgobB9HxrwTelinCObfvW1piZtOEGmAv5t/MUfvl6n7hbk4fYtyBrXYQ6VgeKeNr3AnjiOjWCro19+kzgJ+WkWn8dH9dUel1ypRPWeaiHHD7rWNIqK6GYg15P1YECqw+7a786NcetcmMSsJF4UovjNX4UtpcjjTfs= Semen_Shvets@EPRUMOSW0537"
}

instance_type = "t2.micro"

tags = {
  First_name  = "Semen"
  Last_name   = "Shvets"
  Custome_tag = "from_terraform_tfvars_file"
}

private_key_path = "~/.ssh/id_rsa"

instance_count = 2
