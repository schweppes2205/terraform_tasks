output "sg" {
  value = module.sg.sg
}

output "sg_id" {
  value = module.sg.sg_id
}

output "sgr_ingress" {
  value = module.sg.sgr_ingress
}

output "sgr_egress" {
  value = module.sg.sgr_egress
}

output "instances_id" {
  value = module.ec2.instances_id
}

output "instances_private_ip" {
  value = module.ec2.instances_private_ip
}

output "instances_public_ip" {
  value = module.ec2.instances_public_ip
}

output "ssh_key_arn" {
  value = module.ec2.ssh_key_arn
}

output "vpc_arn" {
  value = module.ec2.vpc_arn
}

output "subnet_arn" {
  value = module.ec2.subnet_arn
}
