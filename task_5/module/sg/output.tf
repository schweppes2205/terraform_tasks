output "sg" {
  value = aws_security_group.sg
}

output "sg_id" {
  value = length(aws_security_group.sg) > 0 ? aws_security_group.sg[0].id : ""
}

output "sgr_ingress" {
  value = aws_security_group_rule.my_sg_ingress
}

output "sgr_egress" {
  value = aws_security_group_rule.my_sg_egress
}
