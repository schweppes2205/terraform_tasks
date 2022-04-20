# DATASOURCES

data "aws_ami" "amzn_ami" {
  most_recent = true
  name_regex  = "amzn2-ami-kernel"
  owners      = ["amazon"]
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
  ami           = data.aws_ami.amzn_ami.id
  tags = merge(var.tags, {
    Name          = "task02-${count.index}"
    Date_creation = timestamp(),
    OS_type       = data.aws_ami.amzn_ami.platform_details
    Account_id    = data.aws_caller_identity.current.account_id
  })
  key_name = aws_key_pair.ssh_key.key_name
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
