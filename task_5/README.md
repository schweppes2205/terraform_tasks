# Working with AWS ASG and AWS ECS services

1. Need to create a module for ASG (includes asg and launch configuration)
2. Need to create a module for ECS specific resources (ECS service, ECS cluster, ECS task definition)
3. Add user data into ASG module to include EC2 instances into ECS cluster.
4. Deploy centos container (https://hub.docker.com/_/centos) to ECS using your modules
