# Terraform features and main structures

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
