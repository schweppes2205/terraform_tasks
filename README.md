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

# 3. Terraform features and main structures

1. Module implementation.
    1. EC2 creation as a separate module
    2. Security Group creation as a separate module
        - module must have the capability to create multiple sg rules
        - sg rule needs to be created as a separate resource
        - input variable for sg rules need to have list(map) type
        - in case we need to delete one of the sg rules in the middle of the list, it needs to be done without any sg rule re-creation.
2. Add user data script for EC2 creation. It should :
    1. Install some packages via YUM
    2. Create a file with “SUCCESS” context 
3. Null resource with remote-exec to print  the file context from 2.b
4. SG and EC2 should be created by condition.
5. No hardcode inside the modules. Everything should be declared as variables and all of them should be set in .tfvars file
6. Outputs should present for all the created resources. You can choose any you prefer, but for each resource described in your code.
7. Output of terraform apply command should be also stored in a file and committed  to your branch

# 4. Terraform 13 key feature

The task is to understand the key feature of TF 13.

Modify the component module created in Task 3, so we can create multiple EC2 instances using map of parameters for EC2 instances. for each for modules should be used here.

# 5. Working with AWS ASG and AWS ECS services

1. Need to create a module for ASG (includes asg and launch configuration)
2. Need to create a module for ECS specific resources (ECS service, ECS cluster, ECS task definition)
3. Add user data into ASG module to include EC2 instances into ECS cluster.
4. Deploy centos container (https://hub.docker.com/_/centos) to ECS using your modules
