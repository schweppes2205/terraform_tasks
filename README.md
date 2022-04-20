# Notes
Terraform version - 0.13.7

# 1. Create a resource that is a VM (t2.micro) in the OI sandbox

## Success criteria:

- The VM should be created via Terraform.
- All cloud resources should have tags Date_creation, OS_type, Your_First_Name, Your_Last_Name, AWS_Account_ID.
- An SSH key pair should be uploaded to AWS via Terraform (keys can be generated locally and manually).
- The default AWS key pair for VM bootstrap should refer to the key pair.
- Put any .txt file to that VM (using provisioners).
- Cat that file remotely (using provisioners).
 
## Advanced:

- Make the VM creation as a Terraform module (can be local folder and not remote one as Bitbucket repo).
- Push the Terraform state file to the S3 bucket (configure an S3 bucket as a Terraform backend).

## Links:

- [About variables, outputs, modules, resources, etc.](https://www.terraform.io/docs/language/index.html)
- [Main Terraform commands.](https://www.terraform.io/docs/commands/index.html)
- [What is 'state' file.](https://www.terraform.io/docs/state/index.html)
- [Backend to store .tf files remotely.](https://www.terraform.io/docs/backends/index.html)
- [Provisioners](https://www.terraform.io/language/resources/provisioners/syntax)

# 2. High-level overview of Terraform and the IAD pipeline

Continue doing the previous task:
- Make VM creation as a Terraform module.
- Configure the S3 backend for Terraform to store state files (need to create your own bucket)
- Use .tfvars file to specify variables there (aws keys, instance type, subnet ids, etc.). So remove all hard-coded values from the code. 
- Also, use count for the resource as a variable, so we can create a module without resources. It can be used in complex components where we need to create resources by the condition.
- Create outputs for the instance (instance ID, private IP, public IP).
