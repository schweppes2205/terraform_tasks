# DATASOURCES

data "aws_ami" "amzn_ami" {
  most_recent = var.ami_search_param.most_recent
  name_regex  = var.ami_search_param.name_regex
  owners      = var.ami_search_param.owners
}

data "aws_vpc" "vpc" {
  id = var.vpc_id
}

data "aws_subnet" "subnet" {
  vpc_id            = data.aws_vpc.vpc.id
  availability_zone = var.availability_zone
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
  count         = var.instance_count
  instance_type = var.instance_type
  ami           = data.aws_ami.amzn_ami.id
  tags = merge(var.tags, {
    Name          = "task02-${count.index}"
    Date_creation = timestamp(),
    OS_type       = data.aws_ami.amzn_ami.platform_details
    Account_id    = data.aws_caller_identity.current.account_id
  })
  key_name = aws_key_pair.ssh_key.key_name
  root_block_device {
    volume_type = "gp3"
  }
  subnet_id = data.aws_subnet.subnet.id
  connection {
    type        = "ssh"
    user        = "ec2-user"
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
