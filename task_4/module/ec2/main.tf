# DATASOURCES

data "aws_ami" "ami" {
  most_recent = var.ami_param.most_recent
  name_regex  = var.ami_param.name_regex
  owners      = var.ami_param.owners
}

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

data "aws_caller_identity" "current" {}

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

resource "aws_instance" "instance" {
  instance_type = var.instance_type
  ami           = data.aws_ami.ami.id
  tags = merge(var.tags, {
    Name          = var.name
    Date_creation = timestamp(),
    OS_type       = data.aws_ami.ami.platform_details
    Account_id    = data.aws_caller_identity.current.account_id
  })
  root_block_device {
    volume_type = var.root_volume_param.volume_type
    volume_size = var.root_volume_param.volume_size
  }
  vpc_security_group_ids = var.sg_id_list
  user_data              = file("${path.module}/userdata.sh")
  key_name               = aws_key_pair.ssh_key.key_name
}

resource "null_resource" "data_from_instance" {
  connection {
    type        = "ssh"
    user        = var.ami_param.local_user
    host        = aws_instance.instance.public_ip
    private_key = file(var.private_key_path)
  }
  provisioner "remote-exec" {
    inline = [
      "while [ ! -f /tmp/testfile ]; do sleep 2; done",
      "cat /tmp/testfile",
    ]
  }
}