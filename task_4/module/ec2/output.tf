output "instances_id" {
  value = aws_instance.instance.id
}

output "instances_private_ip" {
  value = aws_instance.instance.private_ip
}

output "instances_public_ip" {
  value = aws_instance.instance.public_ip
}

output "ssh_key_arn" {
  # value = length(aws_key_pair.ssh_key) > 0 ? aws_key_pair.ssh_key.arn : "0"
  value = aws_key_pair.ssh_key.arn
}

output "vpc_arn" {
  value = data.aws_vpc.vpc.arn
}

output "subnet_arn" {
  value = data.aws_subnet.subnet.arn
}
