# DATASOURCES

data "aws_ami" "ami" {
  most_recent = var.ami_param.most_recent
  name_regex  = var.ami_param.name_regex
  owners      = var.ami_param.owners
}

data "aws_caller_identity" "current" {}

# ---------------------------------------
# VARIABLES

# ---------------------------------------
# RESOURCES

resource "aws_key_pair" "ssh_key" {
  key_name   = var.ssh_public_key.name
  public_key = var.ssh_public_key.value
}

resource "aws_instance" "instance" {
  count         = var.instance_count
  instance_type = var.instance_type
  ami           = data.aws_ami.ami.id
  tags = merge(var.tags, {
    Date_creation = timestamp(),
    OS_type       = data.aws_ami.ami.platform_details
    Account_id    = data.aws_caller_identity.current.account_id
  })
  key_name  = aws_key_pair.ssh_key.key_name
  user_data = file("${path.module}/userdata.sh")
}

resource "null_resource" "data_from_instance" {
  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = aws_instance.instance[*].public_ip
    private_key = file(var.private_key_path)
  }
  provisioner "remote-exec" {
    inline = [
      "cat /tmp/testfile",
    ]
  }
  depends_on = [
    aws_instance.instance
  ]
}
