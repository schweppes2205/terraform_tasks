# DATASOURCES

data "aws_ami" "ami" {
  most_recent = var.ami_param.most_recent
  name_regex  = var.ami_param.name_regex
  owners      = var.ami_param.owners
}

# data "aws_subnet" "subnet" {
#   vpc_id            = var.vpc_id
#   availability_zone = var.availability_zone
#   filter {
#     name   = "tag:Name"
#     values = [var.subnet_name]
#   }
# }

data "aws_caller_identity" "current" {}

# ---------------------------------------
# VARIABLES

# ---------------------------------------
# RESOURCES

resource "aws_key_pair" "ssh_key" {
  count      = var.instance_count > 0 ? 1 : 0
  key_name   = var.ssh_public_key.name
  public_key = var.ssh_public_key.value
  tags = merge(var.tags, {
    AWS_Account_ID = data.aws_caller_identity.current.account_id
  })
}

resource "aws_instance" "instance" {
  # subnet_id     = data.aws_subnet.subnet.id
  subnet_id     = var.subnet_id
  count         = var.instance_count
  instance_type = var.instance_type
  ami           = data.aws_ami.ami.id
  tags = merge(var.tags, {
    Name          = "task_3_${count.index}"
    Date_creation = timestamp(),
    OS_type       = data.aws_ami.ami.platform_details
    Account_id    = data.aws_caller_identity.current.account_id
  })
  key_name = aws_key_pair.ssh_key[0].key_name
  root_block_device {
    volume_type = var.root_volume_param.volume_type
    volume_size = var.root_volume_param.volume_size
  }
  vpc_security_group_ids = var.sg_id_list
  user_data              = file("${path.module}/userdata.sh")
}

resource "null_resource" "data_from_instance" {
  count = var.instance_count
  connection {
    type        = "ssh"
    user        = var.ami_param.local_user
    host        = aws_instance.instance[count.index].public_ip
    private_key = file(var.private_key_path)
  }
  provisioner "remote-exec" {
    inline = [
      "while [ ! -f /tmp/testfile ]; do sleep 2; done",
      "cat /tmp/testfile",
    ]
  }
  depends_on = [
    aws_instance.instance
  ]
}
