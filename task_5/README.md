# Working with AWS ASG and AWS ECS services

1. Need to create a module for ASG (includes asg and launch configuration)
2. Need to create a module for ECS specific resources (ECS service, ECS cluster, ECS task definition)
3. Add user data into ASG module to include EC2 instances into ECS cluster.
4. Deploy centos container (https://hub.docker.com/_/centos) to ECS using your modules

# Questions:

- How to correctly organize the launch config change? Current solution causes tf apply failure after launch config change. In case launch config is changed and needed to be recreated but that is blocked by ASG that hat existing launch config attached. So somehow i need to create a new launch config, attach it to ASG and only after that drop the old one. The lifecycle is not helpful because it creates the launch config with the existing name.
- Noticed that in current configuration in case of changes on any module the plan or apply mechanism detects changes on launch config with no reason (ami data source shows some changes)
