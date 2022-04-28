output "instances_public_ip" {
  value = [for i in aws_instance.instance : i.public_ip]
}

output "instances_arn_public_ip" {
  value = { for i in aws_instance.instance : i.arn => i.public_ip }
}
