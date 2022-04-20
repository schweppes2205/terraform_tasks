# High-level overview of Terraform and the IAD pipeline

Continue doing the previous task:
- Make VM creation as a Terraform module.
- Configure the S3 backend for Terraform to store state files (need to create your own bucket)
- Use .tfvars file to specify variables there (aws keys, instance type, subnet ids, etc.). So remove all hard-coded values from the code. 
- Also, use count for the resource as a variable, so we can create a module without resources. It can be used in complex components where we need to create resources by the condition.
- Create outputs for the instance (instance ID, private IP, public IP).
