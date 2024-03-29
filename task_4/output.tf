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

output "ec2_module_instance_arn-pub_ip" {
  value = [for k, v in module.ec2 : v.instances_arn_public_ip]
}
