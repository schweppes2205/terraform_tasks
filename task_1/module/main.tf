# DATASOURCES

data "aws_ami" "amzn_ami" {
  most_recent = var.ami_search_param.most_recent
  name_regex  = var.ami_search_param.name_regex
  owners      = var.ami_search_param.owners
}

data "aws_caller_identity" "current" {}

data "aws_vpc" "vpc" {
  id = var.vpc_id
}

data "aws_subnet" "subnet" {
  vpc_id            = data.aws_vpc.vpc.id
  availability_zone = var.availability_zone
  filter {
    name   = "tag:Name"
    values = [var.subnet_name]
  }
}

# ---------------------------------------
# VARIABLES
# ---------------------------------------
# RESOURCES


resource "aws_key_pair" "ssh_key" {
  key_name   = var.ssh_public_key.name
  public_key = var.ssh_public_key.value
  tags = merge(var.tags, {
    AWS_Account_ID = data.aws_caller_identity.current.account_id
  })
}

resource "aws_instance" "task-01-instance" {
  instance_type = var.instance_type
  ami           = data.aws_ami.amzn_ami.id
  tags = merge(var.tags, {
    OS_type        = data.aws_ami.amzn_ami.platform_details
    AWS_Account_ID = data.aws_caller_identity.current.account_id
    Name           = "task_01_instance"
  })
  key_name = aws_key_pair.ssh_key.key_name
  root_block_device {
    volume_type = var.root_volume_param.volume_type
    volume_size = var.root_volume_param.volume_size
  }
  subnet_id = data.aws_subnet.subnet.id
  connection {
    type        = "ssh"
    user        = var.ami_search_param.local_user
    host        = self.public_ip
    private_key = file(var.private_key_path)
  }
  provisioner "file" {
    source      = "${path.module}/tst.txt"
    destination = "/tmp/tst.txt"
  }
  provisioner "remote-exec" {
    inline = [
      "cat /tmp/tst.txt",
    ]
  }
}
