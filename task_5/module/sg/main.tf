# DATASOURCES

data "aws_caller_identity" "current" {}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

# ---------------------------------------
# VARIABLES

locals {
  sgr_ingress = var.create_sg ? var.sgr_ingress : []
  sgr_egress  = var.create_sg ? var.sgr_egress : []
}

# ---------------------------------------
# RESOURCES

resource "aws_security_group" "sg" {
  count  = var.create_sg ? 1 : 0
  name   = var.security_group_name
  vpc_id = var.vpc_id
  tags = merge(var.tags, {
    Name           = var.security_group_name
    AWS_Account_ID = data.aws_caller_identity.current.account_id
  })
}

resource "aws_security_group_rule" "my_sg_ingress" {
  type = "ingress"
  for_each = { for item in local.sgr_ingress : join("-", [
    "aws_security_group_rule_ingress",
    md5(join("-", [
      tostring(item.from_port),
      tostring(item.to_port),
      item.protocol,
      item.description,
    ])),
  ]) => item }
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  description       = each.value.description
  cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
  security_group_id = aws_security_group.sg[0].id
}

resource "aws_security_group_rule" "my_sg_egress" {
  type = "egress"
  for_each = { for item in local.sgr_egress : join("-", [
    "aws_security_group_rule_egress",
    md5(join("-", [
      tostring(item.from_port),
      tostring(item.to_port),
      item.protocol,
      item.cidr_blocks,
    ]))
  ]) => item }
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = [each.value.cidr_blocks]
  security_group_id = aws_security_group.sg[0].id
}
